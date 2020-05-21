class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(userid: params[:session][:userid].downcase, password: params[:session][:password])
    if @user
      log_in @user
      redirect_to root_url
    else
      @errormsg = "No user whose user ID and password match"
      @user = User.new(userid: params[:session][:userid], password: params[:session][:password])
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
