class UsersController < ApplicationController
  before_filter :authorize, only: [:index, :show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up!"
      redirect_to users_path
    else
      render('new')
    end
  end

  def show
    @user = User.find(params[:id])
    @tagged = Tag.where(user_id: @user.id)
  end

private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email, :avatar)
  end
end
