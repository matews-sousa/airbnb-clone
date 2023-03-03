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
    if @place.save
      redirect_to show_place_path(@place)
    else
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :headline, :address, :description, :price, :city, :country, :state, images: [])
  end
end
