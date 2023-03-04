class PlaceController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.host = current_user

    if @place.save
      redirect_to show_place_path(@place)
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
