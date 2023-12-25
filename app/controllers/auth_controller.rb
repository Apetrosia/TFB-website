class AuthController < ApplicationController
  def new
  end

  def create
    params = user_params

    user = nil
    if params[:login]
      user = User.find_by(login: params[:login])
    elsif params[:email]
      user = User.find_by(login: params[:email])
    end

    unless user
      gen_text_for_errors(:login)
      render :new
    else
      user = user.authenticate(params[:password])
      unless user
        gen_text_for_errors(:password)
        render :new
      end
    end

    session[:user_id] = user.id if user
    redirect_to root_path if user
  end

  def destroy
      session.delete(:user_id)
      redirect_to root_path, notice: "Вы вышли из аккаунта"
  end

private
  def user_params
    params.require(:user).permit(:login, :email, :password)
  end

    def gen_text_for_errors(error_cause)

      flash.now[:error] = "Введен несуществующий логин" if error_cause == :login
      flash.now[:error] = "Введен неверный пароль" if error_cause == :password

    end

end
