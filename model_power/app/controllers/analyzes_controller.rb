class AnalyzesController < ApplicationController

  # GET /analyzes
  # GET /analyzes.json
  def index
    @questios = Question.all
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
