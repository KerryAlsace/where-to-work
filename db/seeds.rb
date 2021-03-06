# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
  id = i + 1
  neighborhood = Neighborhood.create(name: "Neighborhood #{id}")
  u = User.create(username: "user#{id}", password: "test1234")
  u.places.create(name: "Place #{id}", neighborhood: neighborhood, wifi: true, wifi_quality: 3, public_restroom: true, restroom_cleanliness: 3, costs_money: true, creator_id: u.id, address_attributes: { street1: "#{id} Main st.", city: "New York", state: "NY", zipcode: "1000#{i}"})
end

5.times do |i|
  id = i + 1
  other_id = id + 1
  SharedPlace.create(place_id: id, friend_id: other_id, comment: "User #{other_id} says Place #{id} is great")
end

User.first.admin!

User.last.admin!

# 7.times do
#   neighborhood = Neighborhood.create(name: Faker::GameOfThrones.city)
#   password = "test1234"
#   u = User.new(password: password, password_confirmation: password, username: Faker::GameOfThrones.character )
#   u.save!
#   p = u.places.new(name: Faker::Space.star, neighborhood: neighborhood, address: Faker::Address.street_address, wifi: Faker::Boolean.boolean, wifi_quality: Faker::Number.between(1, 4), public_restroom: Faker::Boolean.boolean, restroom_cleanliness: Faker::Number.between(1, 4), costs_money: Faker::Boolean.boolean, creator_id: u.id)
#   p.save!
# end

# 5.times do |i|
#   id = i + 1
#   other_id = id + 1
#   s = SharedPlace.new(place_id: id, friend_id: other_id, comment: Faker::ChuckNorris.fact)
#   s.save!
# end

# u = User.first
# u.role = "admin"
# u.save!
# u = User.last
# u.role = "admin"
# u.save!