json.extract! @place, :id, :name, :address, :description
json.up_votes @place.votes_for.count
json.reviews @place.reviews do |review|
  json.extract! review, :id, :content, :name
end
json.photos @photos_url
