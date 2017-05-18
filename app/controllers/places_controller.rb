class PlacesController < ApplicationController
  # skip_after_action :verify_policy_scoped, only: [:search, :index]
  before_action :set_place, only: [ :show]
  def index
    # @places = Place.all
    @places = Place.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
    @alert_message = "You are viewing #{@place.name}"
    @place_coordinates = { lat: @place.latitude, lng: @place.longitude }
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.save!
    redirect_to places_path
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place.update(place_params)
    @place.save!
  end



  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :description,:rating,:address, photos: [])
  end
end
