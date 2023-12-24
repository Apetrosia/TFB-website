class RegistrationController < ApplicationController


  def new
    
  end

  def create

    new_user = User.create(user_params)

    if new_user.save
      session[:user_id] = new_user.id
      redirect_to email_verification_path
    else
      gen_text_for_errors(new_user.errors)
      render :new
    end

  end

  def edit
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:login, :email, :password, :password_confirmation)
  end

  def gen_text_for_errors(errors)

    error = errors.first
    case error.type
    when :blank
      flash.now[:error] = "Введите логин" if error.attribute == :login
      flash.now[:error] = "Введите email" if error.attribute == :email
      flash.now[:error] = "Введите пароль" if error.attribute == :password_digest
      flash.now[:error] = "Подтвердите пароль" if error.attribute == :password_confirmation
    when :taken
      flash.now[:error] = "Такой логин уже занят" if error.attribute == :login
      flash.now[:error] = "Такой email уже занят" if error.attribute == :email
    when :invalid
      flash.now[:error] = "Введен некорректный email" if error.attribute == :email
    when :confirmation
      flash.now[:error] = "Повтор пароля не совпадает с паролем" if error.attribute == :password_confirmation
    else
      raise "Необработанная ошибка ввода"
    end

  end
end