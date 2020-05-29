class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@books =@user.book(params[:page]).reverse_order
  end
end
