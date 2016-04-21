class LoginsController < ApplicationController
  def show
      render "new"
  end

  def create
    user = User.find_by_uid params[:uid]
    if user && user.authenticate(params[:pass])
      # セッションのキー:user_idへユーザーのIDを登録
      session[:user_id] = user.uid
      redirect_to users_path
    else
      # flash変数にメッセージをセット
      flash.now.alert = "もう一度入力してください。"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
    redirect_to login_path
  end
end
