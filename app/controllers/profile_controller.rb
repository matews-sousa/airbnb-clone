class ProfileController < ApplicationController
  before_action :authenticate_user!

  # GET /profile/places
  def places
    @places = current_user.places
  end

  # GET /profile/favorites
  def favorites
    @favorites = current_user.favorites.map(&:place)
  end

  # GET /profile/reservations
  def reservations
    @reservations = current_user.reservations.order(created_at: :desc)
  end

  # GET /profile/reservations/:id
  def reservation
    @reservation = Reservation.find(params[:id])
  end
end
