json.array! @places do |place|
  json.extract! place, :id, :name, :address, :description, :rating
end
