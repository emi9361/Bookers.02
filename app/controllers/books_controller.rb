class BooksController < ApplicationController

    before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update]

    def index
        @book = Book.new
        @books = Book.all
        @user = current_user
    end

    def show
        @book = Book.find(params[:id])
        @user = @book.user
        @books = Book.all
    end

    def create
        @books = Book.all
    	@user = current_user
        @book = Book.new(book_params)
    	@book.user_id = @user.id
      if @book.save
        flash[:notice] = 'successfully!!'
    	redirect_to book_path(@book.id)
      else
        render 'index'
    end
    end

    def edit
        @book = Book.find(params[:id])
        @user = current_user
    end
    def update
        @book = Book.find(params[:id])
    if  @book.update(book_params)
        flash[:notice] = "You have updated book successfully."
        redirect_to book_path(@book.id)
    else
        render 'edit'
      end
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end

    private
    def book_params
    params.require(:book).permit(:title, :body, :user_id)
	end

    def correct_user
        book = Book.find(params[:id])
     if current_user != book.user
        redirect_to books_path
      end
    end

end
