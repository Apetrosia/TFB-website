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

  def confirm
    user = User.find_by_email_token params[:token]
    if user.present?
      user.email_conf = true
      user.save
      redirect_to root_path
    else
      #redirect_to root_path
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def show
  end
end
