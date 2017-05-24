class ReviewsController < ApplicationController

  def create
    @place = Place.find(params[:place_id])
    @review = @place.reviews.build(review_params)

    if @review.save
      respond_to do |format|
        format.html { redirect_to place_path(@place) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "places/show" }
        format.js
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :content)
  end
end
