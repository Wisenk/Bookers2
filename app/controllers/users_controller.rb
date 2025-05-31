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
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user), alert: "You can only edit your own profile."
    end
  end
      
  def update
    @user = User.find(params[:id])
    if @user == current_user
      if @user.update(user_params)
        redirect_to user_path(@user), notice: "You have updated user successfully."
      else
        render :edit, status: :unprocessable_entity
      end
      else
        redirect_to user_path(current_user), alert: "You can only update your own profile."
      end
  end

  def view
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    if @user == current_user
      render :view
    else
      redirect_to user_path(@user), alert: "You can only view your own profile."
    end
  end
end

private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end
