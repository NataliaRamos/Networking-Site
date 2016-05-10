class UsersController < ApplicationController
  def index
    @list_user = User.all
    @user = User.find(session[:id])
  end

  def show
      @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to "/users"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/mains"
    end
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :description)
  end
end
