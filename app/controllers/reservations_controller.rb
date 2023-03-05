class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      redirect_to place_path(@reservation.place)
    else
      render 'places/show'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:checkin, :checkout, :guests, :place_id)
  end
end
