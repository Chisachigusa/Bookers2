class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  
  def index
    @user = current_user
    @books = Book.all
    
  end
  
  def create
    book = Book.new(book_params)
    @book.user_id = current_user.id
    book.save
    
    redirect_to boook_path
  end
  
  def show
    redirect_to index
    
  end

  
  
  def edit
    redirect_to index
    redirect_to show
  end

   private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

  
end