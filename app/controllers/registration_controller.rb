class RegistrationController < ApplicationController
  def new
    
  end

  def create    
    user = User.find_by(login:params[:login])
    if (user)
      #todo отослать сигнал во view
      puts "user login"
    end

    email = User.find_by(email:params[:email])
    if (email)
      #todo отослать сигнал во view
      puts "user email"
    end
    
    new_user = User.new
    new_user.login = params[:login]
    new_user.email = params[:email]
    new_user.password = params[:password]
    new_user.password_confirmation = params[:password_confirmation] 
    new_user.save

    if (!new_user.valid?)
      #todo отослать сигнал во view
      puts "new_user invalid"
    end

    redirect_to email_verification_path
  end

  def edit
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:login, :email, :password, :password_confirmation)
  end

end