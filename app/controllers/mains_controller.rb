class MainsController < ApplicationController
  def index
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:id] = user[:id]
      redirect_to '/users'
    else
      flash[:danger] = 'Invalid email/password combination'
      redirect_to "/mains"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/mains'
  end
end
