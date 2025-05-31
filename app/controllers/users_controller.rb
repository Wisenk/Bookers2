class UsersController < ApplicationController


  def show
    @books = Book.all
    @book = Book.new
  end
  
  def index
    @user = current_user
    @users = User.all
    @books = Book.all
    @book = Book.new
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


private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end
end
