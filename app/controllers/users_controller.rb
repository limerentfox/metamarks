class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if current_user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :avatar, :name)
  end
end
