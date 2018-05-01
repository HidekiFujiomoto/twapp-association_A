class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :show,:update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @user = User.new(user_params)
    redirect_to user_path
  end

  def show
    session[:user_id] = @user.id
    @favorites_mutters = @user.favorites_mutters
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                  :password_confirmation,:image,:image_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
