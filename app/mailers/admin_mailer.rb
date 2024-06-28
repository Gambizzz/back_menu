class AdminMailer < ApplicationMailer
  default from: ENV['MJ_DEFAULT_FROM']
  layout 'mailer'

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

  def new_reservation_email(admin, reservation)
    @admin = admin
    @reservation = reservation
    @user = reservation.user
    @restaurant = reservation.restaurant
    @url = "http://localhost:3000/restaurants/#{@restaurant.id}/reservations"
    mail(to: @admin.email, subject: 'Nouvelle réservation reçue')
  end

  def reservation_cancellation(admin, user, reservation)
    @admin = admin
    @user = user
    @reservation = reservation
    @restaurant = reservation.restaurant
    @url = "http://localhost:3000"
    mail(to: @admin.email, subject: 'Annulation de réservation utilisateur')
  end
end
