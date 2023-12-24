class ApplicationMailer < ActionMailer::Base
  default from: "redbread.sup@gmail.com"
  layout "mailer"

  def confirm_email
    @user = params[:user] #127.0.0.1:3000
    @url  = "https://the-first-bogatyr.onrender.com/users/#{@user.id}"
    mail(to: @user.email, subject: 'Подвтердите почту')
  end
end
