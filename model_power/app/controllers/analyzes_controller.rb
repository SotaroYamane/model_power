class AnalyzesController < ApplicationController
  before_action :unless_user

  # GET /analyzes
  # GET /analyzes.json
  def index
    @questios = Question.all
    user_all = User.all
    all_results = Result.all
    q_length = Question.count

    user_all.each do |user|
      model_power = 0
      user_results = Result.find_by_sql(["select * from results where uid = ?", user.uid])
      cal_big = Array.new

#-----Array + Hashの入れ物作成-----
      i = 1
      while i < q_length + 1
        cal_big.insert(i, {"a" => 0, "b" => 0, "c" => 0, "d" => 0})
        i += 1
      end
#-----全部の集計-----
      all_results.each do |result|
        cal_big[result.qid][result.ans] += 1
      end

#-----標準力測定-----
      user_results.each do |result|
        model_power += cal_big[result.qid][result.ans]
      end
      user.score = model_power
      user.save

    end

  end


  def show
    @photos = Question.find_by_sql(["select * from questions where qid = ?", params[:id]])
    women = Result.find_by_sql(["select * from results INNER JOIN users ON results.uid = users.uid where sex = ? AND qid = ?", false, params[:id]]) #女性qid = params[:id]回答
    men = Result.find_by_sql(["select * from results INNER JOIN users ON results.uid = users.uid where sex = ? AND qid = ?", true, params[:id]]) #男性qid = params[:id]回答
    cal_women = {"a" => 0, "b" => 0, "c" => 0, "d" => 0}
    cal_men = {"a" => 0, "b" => 0, "c" => 0, "d" => 0}

#-----全部の集計-----
    women.each do |result|
      cal_women[result.ans] += 1
    end

    men.each do |result|
      cal_men[result.ans] += 1
    end

#-----女グラフ-----
    data = [['a', cal_women["a"]],
            ['b', cal_women["b"]],
            ['c', cal_women["c"]],
            ['d', cal_women["d"]]]
    @graph_women = LazyHighCharts::HighChart.new('graph') do |f|
      f.series(name: '投票数', data: data, type: 'pie')
    end
#-----男グラフ-----
    data = [['a', cal_men["a"]],
            ['b', cal_men["b"]],
            ['c', cal_men["c"]],
            ['d', cal_men["d"]]]
    @graph_men = LazyHighCharts::HighChart.new('graph') do |f|
      f.series(name: '投票数', data: data, type: 'pie')
    end

  end
end
