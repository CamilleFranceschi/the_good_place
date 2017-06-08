class Api::V1::PlacesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_place, only: [ :show, :update, :destroy]
  def index
    @places = policy_scope(Place)

    @address = params[:address]
    if @address
      @places = Place.near(@address, 9)
    else
      @places = Place.where.not(latitude: nil, longitude: nil)
    end

    # @image=Cloudinary::Utils.cloudinary_url(place.photo, :secure => true, :width => 100,:height => 150, :crop => :fill)

    # => "https://res.cloudinary.com/demo/image/upload/c_fill,h_150,w_100/sample.jp

  end


  def show
    @photos=@place.photos
    # => "v1495140480/sf9blb9tm1zj9lqao9b1.png"
    # Cloudinary::Utils.cloudinary_url(photo.path, :secure => true, :width => 100,:height => 150, :crop => :fill)
    # => "https://res.cloudinary.com/dymvgezcn/image/upload/c_fill,h_150,w_100/v1495140480/sf9blb9tm1zj9lqao9b1.png"
    @photos_url = @photos.map { |photo| Cloudinary::Utils.cloudinary_url(photo.path, :secure => true, :width => 100,:height => 150, :crop => :fill)}
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
