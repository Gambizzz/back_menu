class AdminMailer < ApplicationMailer
  default from: ENV['MJ_DEFAULT_FROM']

  def welcome_email(admin)
    @admin = admin
    @url = "http://localhost:3000"
    mail(to: @admin.email, subject: 'Bienvenue sur notre application !')
  end

  def reset_password_instructions(record, token, opts={})
    @token = token
    @url = "http://localhost:3000"
    devise_mail(record, :reset_password_instructions, opts)
  end
end
