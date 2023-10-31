class UsersController < ApplicationController
 def index
   
  end   
 
  def show
    
  end

  # def create
  #   @post_image = PostImage.new(post_image_params)
  #   @post_image.user_id = current_user.id
  #   @post_image.save
  #   redirect_to post_images_path
  # end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update(book_params)
    redirect_to user_path  
  end
  
  private
  def user_params
    params.require(:user).permit(:title, :body, :image)  
  end
    
end
