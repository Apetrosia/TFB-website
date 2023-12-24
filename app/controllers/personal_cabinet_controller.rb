class PersonalCabinetController < ApplicationController

  before_action :find_user
  def show

  end

  def change_photo
    @user.avatar.attach(user_params[:avatar])
    redirect_to user_path(session[:user_id])
  end

  def change_password
    redirect_to registration_new_password_path
  end

  private
  def user_params
    params.require(:user).permit(:login, :email, :password, :avatar)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
