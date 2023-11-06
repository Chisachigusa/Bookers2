class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  
  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
    
  end
  
  def create
    book = Book.new(book_params)
    @book = current_user.id
    book.save
    
    redirect_to book_path(params[:id])
  end
  
  def show
    @user = current_user
    @book = Book.find(params[:id])
    redirect_to index
    
  end

  
  
  def edit
    redirect_to index
    redirect_to show
  end

  def destroy
   
  end
  
   private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

  
end