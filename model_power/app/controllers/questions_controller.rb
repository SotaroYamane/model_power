class QuestionsController < ApplicationController
  require 'pp'
  before_action :unless_user
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
    x = 0
    @answered_list = Result.find_by_sql(["select qid from results where uid = ?", @current_user.uid])
    @answered = Hash.new
    @answered_list.each do |ans|
      @answered.store(x, ans.qid)
      x += 1
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    if Result.find_by(qid: @question.qid, uid: @current_user.uid)
      redirect_to questions_path
    end
  end

  # GET /questions/new
  def new
    @result = Result.new(:qid => params[:qid], :uid => @current_user.uid, :ans => params[:ans])
    if Result.find_by_sql(["select * from results where qid = ? AND uid = ?", params[:qid], @current_user.uid]).empty?
      if @result.save
        @user = User.find_by(uid: @current_user.uid)
        all_results = Result.find_by_sql(["select * from results where qid = ?", params[:qid]])
        cal_big = {"a" => 0, "b" => 0, "c" => 0, "d" => 0}
        
    #-----全部の集計-----
        all_results.each do |result|
          cal_big[result.ans] += 1
        end

    #-----標準力測定-----
        @user.score += cal_big[@result.ans]
        @user.save

    #-----redirect-----
        redirect_to :controller => "results", :action => "show" ,:id => @result.qid
      end
    else
      redirect_to :controller => "results", :action => "show" ,:id => @result.qid
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find_by(qid: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:qid, :a, :b, :c, :d, :y, :z)
    end
end
