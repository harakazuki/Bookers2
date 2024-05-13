class UsersController < ApplicationController
before_action :is_matching_login_user, only: [:edit]

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @books = Book.all
    @users = User.all
    @user =  User.find(params[:id])
    @book = Book.new
  end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end

  def update
    is_matching_login_user
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "You have updated user successfully."
      redirect_to @user
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def is_matching_login_user
    user = User.find(params[:id])
  unless user.id == current_user.id
      redirect_to user_path(current_user.id)
  end
  end
end