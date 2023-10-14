class BooksController < ApplicationController
  def new
    @book = new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    
    redirect_to index
  def show
    redirect_to index
    
  end

  def index
    redirect_to show
    redirect_to edit
  end
  
  def edit
    redirect_to index
    redirect_to show
  end

   private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  
end
