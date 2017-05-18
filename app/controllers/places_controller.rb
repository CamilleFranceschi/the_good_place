class PlacesController < ApplicationController
  # skip_after_action :verify_policy_scoped, only: [:search, :index]
  before_action :set_place, only: [ :show]
  def index
    @places = Place.all
  end

  def show
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
