# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 10.times do |i|
#   id = i + 1
#   neighborhood = Neighborhood.create(name: "Neighborhood #{id}")
#   u = User.create(username: "user#{id}", password: "test1234")
#   u.places.create(name: "Place #{id}", neighborhood: neighborhood, address: "1234 Broadway", wifi: true, wifi_quality: 3, public_restroom: true, restroom_cleanliness: 3, costs_money: true, creator_id: u.id)
# end

# 5.times do |i|
#   id = i + 1
#   other_id = id + 1
#   SharedPlace.create(place_id: id, friend_id: other_id, comment: "User #{other_id} says Place #{id} is great")
# end

# User.first.admin!

# User.last.admin!


7.times do
  neighborhood = Neighborhood.create(name: Faker::GameOfThrones.city)
  password = "test1234"
  u = User.new(password: password, password_confirmation: password, username: Faker::GameOfThrones.character )
  u.save!
  p = u.places.new(name: Faker::Space.star, neighborhood: neighborhood, address: Faker::Address.street_address, wifi: Faker::Boolean.boolean, wifi_quality: Faker::Number.between(1, 4), public_restroom: Faker::Boolean.boolean, restroom_cleanliness: Faker::Number.between(1, 4), costs_money: Faker::Boolean.boolean, creator_id: u.id)
  p.save!
end

5.times do |i|
  id = i + 1
  other_id = id + 1
  s = SharedPlace.new(place_id: id, friend_id: other_id, comment: Faker::ChuckNorris.fact)
  s.save!
end

u = User.first
u.role = "admin"
u.save!
u = User.last
u.role = "admin"
u.save!

# Users:
# 0 Jaqen H'ghar
# 1 Robb Stark
# 2 Viserys Targaryen
# 3 Robert Baratheon
# 4 Daenerys Targaryen
# 5 Davos Seaworth
# 6 Shae

# Neighborhoods:
# 0 Yunkai
# 1 Tyrosh
# 2 Mantarys
# 3 King's Landing
# 4 Sunspear
# 5 New Ghis
# 6 Old Valyria

# Places:
# 0 Betelgeuse
# 1 Arcturus
# 2 Betelgeuse
# 3 Betelgeuse
# 4 Arcturus
# 5 Rigil Kentaurus
# 6 Sirius A

# SharedPlaces:
# 0 friend:2, place:1
# 1 friend:3, place:2
# 2 friend:4, place:3
# 3 friend:5, place:4
# 4 friend:6, place:5