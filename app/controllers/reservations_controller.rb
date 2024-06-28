class ReservationsController < ApplicationController
  before_action :require_login, only: [:new, :create, :destroy]
  before_action :authorize_admin!, only: [:destroy]

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservations = @restaurant.reservations.includes(:user)
    render json: @reservations.as_json(include: { user: { only: :email } })
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      UserMailer.reservation_confirmation(current_user, @reservation).deliver_now
      send_admin_notification(@reservation)
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find_by(id: params[:id])
    if @reservation
      UserMailer.reservation_cancellation(@reservation.user, @reservation).deliver_now
      send_admin_cancellation_notification(@reservation)
      @reservation.destroy
      render json: { message: "La réservation a été supprimée avec succès!" }, status: :ok
    else
      render json: { error: "La réservation que vous essayez de supprimer n'existe pas ou vous n'êtes pas autorisé à la supprimer." }, status: :not_found
    end
  end

  def user_reservations
    @user = User.find(params[:user_id])
    @reservations = @user.reservations
    render json: @reservations
  end

  private

  def authorize_admin!
    @reservation = Reservation.find(params[:id])
    unless current_admin || current_user
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def require_login
    unless current_user || current_admin
      redirect_to new_user_session_path
    end
  end

  def send_admin_notification(reservation)
    admin = reservation.restaurant.admin
    AdminMailer.new_reservation_email(admin, reservation).deliver_now if admin.present?
  end

  def send_admin_cancellation_notification(reservation)
    admin = reservation.restaurant.admin
    AdminMailer.reservation_cancellation(admin, reservation.user, reservation).deliver_now if admin.present?
  end

  def reservation_params
    params.require(:reservation).permit(:number, :date, :time, :restaurant_id)
  end
end
