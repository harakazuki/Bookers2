class BooksController < ApplicationController
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
    @books = Book.all
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @users = User.all
    @books = Book.all
    @book = Book.find(params[:id])
    @user = @book.user

  end

  def edit
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end