json.array! @places do |place|
  json.extract! place, :id, :name, :latitude, :longitude
end
json.array! @photosurl do |photo|
  json.photo photo
end

