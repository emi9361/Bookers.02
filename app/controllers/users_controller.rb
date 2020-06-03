class UsersController < ApplicationController

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

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
    flash[:notice] = "You have creatad book successfully."
    redirect_to books_path
    else
    render 'show'
   end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
	  @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have creatad book successfully."
    redirect_to user_path(@user)
    else
    render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def book_params
    params.require(:user).permit(:title, :body)
  end
end

