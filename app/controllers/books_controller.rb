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
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: "You have updated book successfully."
    else
      render :edit
    end
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end