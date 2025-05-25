class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @new_book = Book.new
    if @user == current_user
      render :view
    else
      render :show
    end
  end

  def edit
  end

  def view
  end
end
