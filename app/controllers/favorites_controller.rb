class FavoritesController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @place = Place.find(favorite_params[:place_id])
    @favorite = Favorite.new(user: current_user, place: @place)

    if @favorite.save
      send_turbo_stream(@favorite, @place)
    else
      redirect_back fallback_location: request.referer
    end
  end
  
  def destroy
    @favorite = Favorite.find(params[:id])
    @place = @favorite.place
    @favorite.destroy
    send_turbo_stream(nil, @place)
  end

  private

  def send_turbo_stream(favorite, place)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "#{dom_id(place)}_favorite",
          partial: "shared/favorite_button",
          locals: { favorite: favorite, place: place }
        )
      end
    end
  end  

  def favorite_params
    params.require(:favorite).permit(:place_id)
  end
end