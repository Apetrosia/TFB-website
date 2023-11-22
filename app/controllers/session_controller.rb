class SessionController < ApplicationController
    def new
    end

    def create
        user_params = params.require(:session)

        user = User.find_by(email: user_params[:email])

        if user.presence?
            session[:user_id] = user.id

            redirect_to root_path, notice "вы вошли на сайт"
        else
            flash.now[:alert] = "неправильный email или пароль"
              
            render :new
        end
    end


    def delete
        session.delete(:user_id)

        redirect_to root_path, notice: "вы вышли из аккаунта"
    end
end