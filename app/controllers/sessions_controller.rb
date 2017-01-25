class SessionsController < ApplicationController

  def new
    if cookies.signed[:user_id]
      @user = User.find(cookies.signed[:user_id])
      session[:user_id] = @user.id
      redirect_to bookmarks_path
    end
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if params[:remember_me]
        cookies.signed[:user_id] = {value: @user.id, expires: 2.weeks.from_now}
      else
        cookies.signed[:user_id] = @user.id
      end
      redirect_to bookmarks_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    cookies.delete :user_id
    redirect_to login_path
  end
end
