class EmailController < ApplicationController
  def new
  end

  def create
    #respond_to do |format|
      ApplicationMailer.with(user: current_user).confirm_email.deliver_now!
      #format.html { redirect_to(@user, notice: 'User was successfully created.') }
      #format.json { render json: @user, status: :created, location: @user }
      #end
  end

  def show
  end
end
