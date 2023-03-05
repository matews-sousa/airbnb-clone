class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @places = Place.where(host: current_user)
  end

  def show
    @place = Place.find(params[:id])
    @favorite = current_user.favorites.find_by(place_id: @place.id) if current_user
    @reservation = Reservation.new
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.host = current_user

    if @place.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(
      :name, 
      :headline, 
      :description, 
      :price,
      :cleaning_fee,
      :max_guests,
      :rooms,
      :beds,
      :baths,
      :min_reservation_days, 
      :address_1, 
      :address_2, 
      :postal_code, 
      :city, 
      :country, 
      :state, 
      :latitude, 
      :longitude, 
      images: [])
  end
end
