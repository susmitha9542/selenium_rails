class UserMailer < ApplicationMailer
  def send_email
    @user = current_user
    mail(to: @user.email, subject: 'Check your Results')
  end
end
