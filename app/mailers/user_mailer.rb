class UserMailer < ApplicationMailer

  default from: User::MAILER_FROM_EMAIL

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirmation.subject
  
  def confirmation(user, confirmation_token)
    @user = user
    @confirmation_token = confirmation_token
    
    mail to: @user.email, subject: "Account Confirmation Instructions"
  end
end
