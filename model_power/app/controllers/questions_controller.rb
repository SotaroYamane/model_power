class QuestionsController < ApplicationController
  require 'pp'
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

  end

  # GET /questions/new
  def new
    @result = Result.new(:qid => params[:qid], :uid => @current_user.uid, :ans => params[:ans])
    if @result.save
      redirect_to :controller => "results", :action => "show" ,:id => @result.qid
    end
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create

  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:qid, :a, :b, :c, :d, :z)
    end
end
