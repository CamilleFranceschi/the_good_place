class AddPlaceReferenceToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :place, foreign_key: true
  end
end
