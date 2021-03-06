class UsersController < ApplicationController

 before_action :authenticate_user!
 before_action :correct_user, only: [:edit, :update]

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])
  	@books =@user.books.page(params[:page]).reverse_order
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
    user = User.all
  end

  def update
  	  @user = User.find(params[:id])
   if @user.update(user_params)
      flash[:notice] = "successfully."
      redirect_to user_path(@user)
   else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
        user = User.find(params[:id])
     if current_user != user
        redirect_to user_path(current_user)
      end
    end

end

