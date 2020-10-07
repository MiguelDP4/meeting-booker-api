# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |i|
  User.create(name: "tester#{i+1}", password: "asdfasdf", password_confirmation: "asdfasdf")
end

ConferenceRoom.create(size: 20, projector: true)
ConferenceRoom.create(size: 5, projector: false)
ConferenceRoom.create(size: 8, projector: false)
ConferenceRoom.create(size: 10, projector: true)
ConferenceRoom.create(size: 50, projector: true)
ConferenceRoom.create(size: 15, projector: false)
ConferenceRoom.create(size: 15, projector: true)