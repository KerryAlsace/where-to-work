# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

random_boolean = [true, false].sample

10.times do |i|
  id = i + 1
  other_id = id + 1
  neighborhood = Neighborhood.create(name: "Neighborhood #{id}")
  u = User.create(username: "user#{id}", password: "test1234")

  5.times do |n|
    p = u.places.create(name: "#{Faker::LordOfTheRings.unique.location}", neighborhood: neighborhood, wifi: "#{random_boolean}", wifi_quality: "#{rand(5)}", public_restroom: "#{random_boolean}", restroom_cleanliness: "#{rand(5)}", costs_money: "#{random_boolean}", creator_id: u.id, address_attributes: { street1: "#{rand(5)} Main st.", city: "New York", state: "NY", zipcode: "1000#{i}"})
    SharedPlace.create(place_id: p.id, friend_id: other_id)
    3.times do |r|
      c = Comment.create(place_id: p.id, body: "#{Faker::ChuckNorris.fact}")
      p.comments << c
    end
  end
end

User.first.admin!

User.last.admin!
