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
  if @user.update(user_params)
    flash[:notice] = "Profile updated successfully."
    redirect_to root_path
  else
    flash.now[:alert] = "Failed to update profile."
    render :edit
  end
end

  def view
  end
end

private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end
