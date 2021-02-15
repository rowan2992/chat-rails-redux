# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.all.each do |user|
  user.destroy
end
puts 'Users deleted'

Channel.all.each do |channel|
  channel.destroy
end
puts 'Channels deleted'

Message.all.each do |message|
  message.destroy
end
puts 'Messages deleted'

puts "Commensing Seeding"

users = [
  { email: "rowan@lewagon.com", password: "123456" },
  { email: "fraser@lewagon.com", password: "123456" },
  { email: "bianca@lewagon.com", password: "123456" }
]

users.each do |user|
  User.create( email: user[:email], password: user[:password] )
end

puts "Users created"

channels = ["general", "nerdtalk", "sports" ]

channels.each do |channel|
  Channel.create( name: channel )
end

puts "Channels created"

channel = Channel.first

User.all.each do |user|
  3.times do 
    channel = Channel.all.sample
    Message.create( user: user, channel: channel, content: Faker::Games::Fallout.quote )
  end
end

puts "Messages created"
