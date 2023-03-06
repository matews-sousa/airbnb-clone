class ProfileController < ApplicationController
  before_action :authenticate_user!

  def places
    @places = current_user.places
  end

  def favorites
    @favorites = current_user.favorites.map(&:place)
  end

  def reservations
    @reservations = current_user.reservations.map(&:place)
  end
end
