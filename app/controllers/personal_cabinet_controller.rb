class PersonalCabinetController < ApplicationController

  before_action :find_user
  def show

  end

  def change_photo
    @user.avatar.attach(user_params[:avatar])
    redirect_to user_path(session[:user_id])
  end

  private
  def user_params
    params.require(:user).permit(:login, :email, :password, :avatar)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
