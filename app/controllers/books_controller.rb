class BooksController < ApplicationController

  def new
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users = User.all
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    @user = current_user
    @books = Book.all
    if @book.save
      redirect_to book_path(@book)
      flash[:notice] = "You have created book successfully."
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @users = User.all
  
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
      flash[:alert] = "You are not authorized to edit this book."
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
      flash[:notice] = "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end

