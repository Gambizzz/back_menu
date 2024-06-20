class UserMailer < Devise::Mailer
  default from: ENV['MJ_DEFAULT_FROM']
  layout 'mailer'

  def welcome_email(user)
    @user = user
    @url = "http://localhost:3000"
    mail(to: @user.email, subject: 'Bienvenue sur notre application !')
  end

  def reset_password_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :reset_password_instructions, opts)
  end
end