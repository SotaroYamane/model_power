class UsersController < ApplicationController
  before_action :unless_user, only: [:index]
  before_action :set_user, only: [:index, :show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    model_power = 0
    user_results = Result.find_by_sql(["select * from results where uid = ?", @current_user.uid])
    all_results = Result.all
    q_length = Question.count
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
    @user.score = model_power
    @user.save

#-----ランキング-----
#上位20人 + 自分の順位
    @all_rank = User.find_by_sql(["select name, score from users order by score DESC LIMIT 20"])
    @user_rank = User.find_by_sql(["select uid, score from users where score >= ?", @user.score]).count


  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      begin
        if @user.save
          session[:user_id] = @user.uid
          format.html { redirect_to users_path, notice: 'ようこそ！' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new, notice: 'UserIDが重複しちゃったゴメン' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      rescue
        flash.now[:alert] = "UserIDが重複しています。"
        format.html { render :new }
      end
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
