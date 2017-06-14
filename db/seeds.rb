# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Creating users...'
john = User.create!(email: 'john@beatles.com', password: 'testtest')
paul = User.create!(email: 'paul@beatles.com', password: 'testtest')
ringo = User.create!(email: 'ringo@beatles.com', password: 'testtest')
george = User.create!(email: 'george@beatles.com', password: 'testtest')

puts 'Creating Places...'
nuba = Place.create!(
  name: 'Le Nuba',
  description: "super",
  address: "20 boulevard Arago Paris"
)

wanderlust = Place.create!(
  name: 'Le Wanderlust',
  description: "super",
  address: "26 boulevard Arago Paris"
)

puts 'Creating votes...'
john.up_votes nuba
paul.up_votes nuba
george.up_votes nuba
ringo.up_votes wanderlust

puts 'Finished!'
