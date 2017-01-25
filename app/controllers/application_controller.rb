class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def home
    if cookies.signed[:user_id]
      @user = User.find(cookies.signed[:user_id])
      session[:user_id] = @user.id
      redirect_to bookmarks_path
    end
  end

  private

  def authenticate_user
    if !logged_in?
      flash[:notice] = 'You must be logged in to view this'
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end


end
