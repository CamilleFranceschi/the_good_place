json.array! @places do |place|
  json.extract! place, :id, :name, :latitude, :longitude
  json.up_votes place.votes_for.count
end

