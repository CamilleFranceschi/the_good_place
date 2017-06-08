json.array! @places do |place|
  json.extract! place, :id, :name, :address, :description, :rating, :latitude, :longitude
  # json.array! place.photos do |image|
  #   # json.extract! image, Cloudinary::Utils.cloudinary_url(image.path, :secure => true, :width => 100,:height => 150, :crop => :fill)
  #   # json.url url_for(image.path)
  #   # json.extract! image, :path
  #   json.url image.path
  # end
end


#  url=place.photos.first.path
# => "v1495140480/sf9blb9tm1zj9lqao9b1.png"
#     Cloudinary::Utils.cloudinary_url(url, :secure => true, :width => 100,:height => 150, :crop => :fill)
# => "https://res.cloudinary.com/dymvgezcn/image/upload/c_fill,h_150,w_100/v1495140480/sf9blb9tm1zj9lqao9b1.png"
