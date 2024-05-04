class BooksController < ApplicationController
  def create
      @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render :index
    end
  end
  
  def index
    @book = Book.new
    @user = current_user
  end

  def show
  end

  def edit
  end
end