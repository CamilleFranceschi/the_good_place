class PlacesController < ApplicationController
  # skip_after_action :verify_policy_scoped, only: [:search, :index]
  before_action :set_place, only: [ :show, :update]
  def index
    # @places = Place.all
    # we take only flats with lat and long
    @address = params[:address]
    if @address
      @places = Place.near(@address, 9)
    else
      @places = Place.where.not(latitude: nil, longitude: nil)
    end

    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.picture ({
        "url" => ApplicationController.helpers.asset_path("marker-bar-location.png"),
        "width" => 60,
        "height" => 90,
      })
      marker.json({id: place.id})
      marker.infowindow render_to_string(partial: "infowindow", locals: { place: place })
    end
  end

  def show
    @alert_message = "You are viewing #{@place.name}"
    @place_coordinates = { lat: @place.latitude, lng: @place.longitude }
    @review = Review.new
    @reviews = @place.reviews
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.build(place_params)

    if @place.save
      if  current_user.places.count == 1
        PlaceMailer.thank_you(@place).deliver_now
      end
      redirect_to places_path
    else
      render :new
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place.update(place_params)
    @place.save!
    redirect_to places_path
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :description,:rating,:address, photos: [])
  end
end
