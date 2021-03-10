class BooksController < ApplicationController
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
    else
      @books = Book.all
      render 'index'
    end
  end
  
  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end
  
  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path
    end
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
