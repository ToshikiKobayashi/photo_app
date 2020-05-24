class SessionsController < ApplicationController

  # ログイン画面表示
  def new
  end

  # ログイン時の処理
  def create
    # UserIDとPasswordを取得する
    @user = User.find_by(userid: params[:session][:userid].downcase, password: params[:session][:password])
    if @user
      # 取得成功時
      log_in @user
      redirect_to root_url
    else
      # 取得失敗時
      @user = User.new(userid: params[:session][:userid], password: params[:session][:password])
      @errormsg = "ユーザIDとパスワードが一致するユーザが存在しません"
      render 'new'
    end
  end

  # ログアウト時の処理
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
