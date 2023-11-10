class AuthController < ApplicationController
  def new
  end

  def create
    # validate input
    user = User.find_by(email: params[:email])&.authenticate(params[:password])
    if user
      redirect_to root_path
    end
  end

  def destroy
  end

private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
