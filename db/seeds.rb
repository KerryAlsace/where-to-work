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
  u.places.create(name: "Place #{id}", neighborhood: neighborhood, address: "1234 Broadway", wifi: true, wifi_quality: 3, public_restroom: true, restroom_cleanliness: 3, costs_money: true, creator_id: u.id)
end

5.times do |i|
  id = i + 1
  other_id = id + 1
  SharedPlace.create(place_id: id, friend_id: other_id, comment: "User #{other_id} says Place #{id} is great")
end

User.first.admin!

User.last.admin!