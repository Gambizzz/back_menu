class AdminMailer < ApplicationMailer
  default from: ENV['MJ_DEFAULT_FROM']
  layout 'mailer'

  def welcome_email(admin)
    @admin = admin
    @url = "http://localhost:5173/admin/login"
    mail(to: @admin.email, subject: 'Bienvenue sur notre application !')
  end

  def reset_password_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :reset_password_instructions, opts)
  end
end
