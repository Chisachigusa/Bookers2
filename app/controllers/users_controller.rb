class UsersController < ApplicationController
  def create
    user = user.new(user_params)
    if user.after_sign_in_path_for(resource)
      flash[:notice] = "Signed in successfully."
      redirect_to user_path(current_user)
    else
      render :new
    end  
    
  end
  
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end   
 
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  
  
  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
    redirect_to user_path(current_user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    unless @user.id == current_user.id
    redirect_to user_path(current_user)
    end
    if @user.update(user_params)
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image,)  
  end
end   
