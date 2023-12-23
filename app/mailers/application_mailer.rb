class ApplicationMailer < ApplicationMailer
  default from: "redbread.sup@gmail.com"
  layout "mailer"

  def confirm_email
    @user = params[:user]
    @url  = 'https://the-first-bogatyr.onrender.com/users/' + @user.id
    mail(to: @user.email, subject: 'Подвтердите почту')
  end
end
