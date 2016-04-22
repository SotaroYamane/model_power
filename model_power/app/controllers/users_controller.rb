class UsersController < ApplicationController
  require 'pp'

  before_action :set_user, only: [:index, :show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @model_power = 0
    user_results = Result.find_by_sql(["select * from results where uid = ?", @current_user.uid])
    all_results = Result.all
    q_length = Question.count
    cal_big = Array.new
    cal_small = Hash.new
    cal_small = {"a" => 0, "b" => 0, "c" => 0, "d" => 0}

    i = 1
    while i < q_length + 1
      cal_big.insert(i, cal_small)
      i += 1
    end
#-----全部の集計-----
    all_results.each do |result|
      cal_big[result.qid][result.ans] += 1
    end

#-----標準力測定-----
    user_results.each do |result|
      @model_power += cal_big[result.qid][result.ans]
    end
    @user.score = @model_power
    @user.save


  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      begin
        if @user.save
          session[:user_id] = @user.uid
          format.html { redirect_to @user, notice: 'やったぜ' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      rescue
        format.html { render :new, notice: "ユーザ名が重複しちゃったゴメン" }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(uid: @current_user.uid)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:uid, :sex, :age, :name, :password, :admin)
    end
end
