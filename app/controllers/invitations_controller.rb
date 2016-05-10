class InvitationsController < ApplicationController
  before_action :current_user
  def create
    invitation = @user.invitations.new(:colleague_id => params[:colleague_id])
    if invitation.save
      flash[:notice] = "Invitation request made."
      redirect_to "/networks/#{session[:id]}"
    else
      flash[:errors] ="Invitation was not saved"
      redirect_to '/users'
    end
  end

  def destroy
    Invitation.delete(params[:id])
    redirect_to "/networks/#{session[:id]}"
  end
  private
  def current_user
    @user = User.find(session[:id])
  end
end
