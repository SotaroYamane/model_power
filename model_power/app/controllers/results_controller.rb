class ResultsController < ApplicationController
  before_action :unless_user
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  # GET /results/1
  # GET /results/1.json
  def show
#-----グラフ作成-----
    q_result = Result.find_by_sql(["select ans from results where qid = ?", @result[0].qid])
    @photos = Question.find_by_sql(["select * from questions where qid = ?", @result[0].qid])
    graph_data = Hash.new
    graph_data = {"a" => 0, "b" => 0, "c" => 0, "d" => 0}

    q_result.each do |res|
      graph_data[res.ans] += 1
    end

    data = [['a', graph_data["a"]],
            ['b', graph_data["b"]],
            ['c', graph_data["c"]],
            ['d', graph_data["d"]]]
    @graph = LazyHighCharts::HighChart.new('graph') do |f|
      f.series(name: '投票数', data: data, type: 'pie')
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find_by_sql(["select * from results where qid = ? AND uid = ?", params[:id], @current_user.uid])
      if @result.empty?
        redirect_to questions_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(:rid, :qid, :uid, :ans)
    end
end
