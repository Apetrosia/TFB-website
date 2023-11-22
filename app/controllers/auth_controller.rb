class AuthController < ApplicationController
  def new
  end

  def create
    params = user_params

    @errors_map = {}

    user = nil
    if params[:login]
      user = User.find_by(login: params[:login])
    elsif params[:email]
      user = User.find_by(login: params[:email])
    end

    gen_text_for_errors(:login) unless user

    if user
      user = user.authenticate(params[:password])
      gen_text_for_errors(:password) unless user
    end

    session[:user_id] = user.id if user
    redirect_to root_path if user
  end

  def destroy
  end

private
  def user_params
    params.require(:user).permit(:login, :email, :password)
  end

    def gen_text_for_errors(error_cause)

      @errors_map[:login_error] = "Введен несуществующий логин" if error_cause == :login
      @errors_map[:password_error] = "Введен неверный пароль" if error_cause == :password

    end

end
