json.extract! @place, :id, :name, :address, :description, :rating
json.reviews @place.reviews do |review|
  json.extract! review, :id, :content, :name
end
json.photos @photos_url
