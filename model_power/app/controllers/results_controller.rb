class ResultsController < ApplicationController
  require 'pp'
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  # GET /results
  # GET /results.json
  def index
    @results = Result.all
  end

  # GET /results/1
  # GET /results/1.json
  def show
    q_result = Result.find_by_sql(["select ans from results where qid = ?", @result[0].qid])
    @graph_data = Hash.new
    @graph_data = {"a" => 0, "b" => 0, "c" => 0, "d" => 0}


    q_result.each do |res|
      @graph_data[res.ans] += 1
    end

    xAxis_categories = ['a', 'b', 'c', 'd']
    data             = [['a', @graph_data["a"]],
                        ['b', @graph_data["b"]],
                        ['c', @graph_data["c"]],
                        ['d', @graph_data["d"]]]
    @graph = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(categories: ['a', 'b', 'c', 'd'])
      f.series(name: '投票数', data: data, type: 'pie')
    end

  end

  # GET /results/new
  def new
    @result = Result.new
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  # POST /results.json
  def create
    @result = Result.new(result_params)

    respond_to do |format|
      if @result.save
        format.html { redirect_to @result, notice: 'Result was successfully created.' }
        format.json { render :show, status: :created, location: @result }
      else
        format.html { render :new }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to @result, notice: 'Result was successfully updated.' }
        format.json { render :show, status: :ok, location: @result }
      else
        format.html { render :edit }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to results_url, notice: 'Result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find_by_sql(["select * from results where qid = ? AND uid = ?", params[:id], @current_user.uid])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(:rid, :qid, :uid, :ans)
    end
end
