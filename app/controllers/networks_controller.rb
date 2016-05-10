class NetworksController < ApplicationController
  before_action :current_user, :only => [:create, :show, :destroy]

  def create
    begin
      ActiveRecord::Base.transaction do
        @colleague = User.find(params[:colleague_id])
        Invitation.delete(params[:id])
        @network = @user.networks.create(:colleague => @colleague)
        @inverse_network = @colleague.networks.create(:colleague => @user)
        [@network, @inverse_network].each do |net|
          raise "validation errors" unless net.errors.empty?
        end
      end
    rescue => e
      puts e.inspect
      puts "e errors"
      flash[:notice] = "Network request denied."
      return redirect_to '/users'
    end
    flash[:notice] = "Network request made."
    redirect_to "/networks/#{session[:id]}"
  end

  def show
    @colleagues = @user.colleagues
    @invitations = Invitation.where(:colleague_id => @user.id)
  end

  def destroy
    Invitation.delete(params[:id])
  end

  private
  def current_user
    @user = User.find(session[:id])
  end
end
