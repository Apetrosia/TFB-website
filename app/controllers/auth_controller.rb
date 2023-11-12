class AuthController < ApplicationController
  def new
  end

  def create
    # validate input
    params = user_params # for tests
    user = User.find_by(login: params[:login])
    # TODO: исправить на Ruby style :)
    unless user
      # сообщение о неправильном логине
    else
      user = user.authenticate(params[:password])
      unless user
      # сообщение о неправильном пароле
      else
        # смена кнопки с Войти на Выйти
        redirect_to root_path
      end
    end
  end

  def destroy
  end

private
  def user_params
    params.require(:user).permit(:login, :email, :password)
  end
end
