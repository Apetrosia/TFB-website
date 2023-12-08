class RegistrationController < ApplicationController


  def new
    
  end

  def create
    params = user_params

    new_user = User.create(user_params)
    new_user.login = params[:login]
    new_user.email = params[:email]
    new_user.password = params[:password]
    new_user.banned = false
    new_user.password_confirmation = params[:password_confirmation] 

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
    when :taken
      flash.now[:error] = "Такой логин уже занят" if error.attribute == :login
      flash.now[:error] = "Такой email уже занят" if error.attribute == :email
    when :invalid
      flash.now[:error] = "Введен некорректный email" if error.attribute == :email
    when :confirmation
      flash.now[:error] = "Подтверждение пароля не совпадает с паролем" if error.attribute == :password_confirmation
    else
      raise "Необработанная ошибка ввода"
    end

  end
end