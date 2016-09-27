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
  u.places.create(name: "Place #{id}", place_type: "coffee shop", neighborhood: neighborhood, address: "1234 Broadway", comments: "Gets crowded", wifi: true, wifi_quality: 3, public_restroom: true, restroom_cleanliness: 3, costs_money: true, available_for_purchase: "coffee", creator_id: u.id)
end

