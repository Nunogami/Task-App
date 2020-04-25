class SessionsController < ApplicationController
 before_action :logged_in_user, only: :new
 
  def logged_in_user
    if !current_user.nil?
      flash[:success] = 'すでにログインしています。'
      redirect_to user_path(current_user)
    end
  end
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = 'ログインしました。'
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = '認証に失敗しました。'
      render :new
    end
  end
  
  def destroy
    log_out if logged_in?
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
end
