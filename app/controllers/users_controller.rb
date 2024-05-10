class UsersController < ApplicationController
  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to books_path
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end
  
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
    @user = current_user
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice:"You have updated user successfully."
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
