class BooksController < ApplicationController
  
  def new
  end
  
  def create
    @book = Book.new(book_params)
    @book_user_id = current_user.id
    @book.save
    redirect_to index
  end
  
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def show
  end
  
  def edit
  end
  
  def destroy
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
