class BooksController < ApplicationController
  def new
    @book = Book.new
    @user = current_user
  end
  
  
  def index
    
    @book = Book.new
    @users = User.all
    @books = Book.all
    
  end
  
  def create
    user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end
  
  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  
  
  def edit
    @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
    redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    unless @book.user.id== current_user.id
    redirect_to books_path
    end
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:notice] = "You have updated book successfully."
    else
      render :edit
    end
  end
  
  def destroy
   book = Book.find(params[:id])
   book.destroy
   redirect_to books_path
  end
  
   private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

  
end