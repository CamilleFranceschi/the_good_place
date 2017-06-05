class Api::V1::PlacesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_place, only: [ :show, :update, :destroy]
  def index
    @places = policy_scope(Place)
  end

  def show
  end

  def update
    if @place.update(place_params)
      render :show
    else
      render_error
    end
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    authorize @place
    if @place.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
   @place.destroy
    # render :index
    head :no_content
  end

  private

  def set_place
    @place = Place.find(params[:id])
    authorize @place
  end

  def place_params
    params.require(:place).permit(:name, :description,:rating,:address, photos: [])
  end

  def render_error
    render json: { errors: @restaurant.errors.full_messages },
      status: :unprocessable_entity
  end
end
