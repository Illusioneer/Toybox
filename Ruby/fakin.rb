# this is faker code
require 'rubygems'
require 'faker'
20.times do
  puts Faker::Name.name
  puts Faker::Internet.email
  puts Faker::Address.street_address
  puts Faker::Address.city
  puts Faker::Address.us_state
  puts Faker::Address.zip_code
  puts "COMMENT #{Faker::Lorem.sentences(2)}"
  puts "\n"
  puts "\n"
  puts "\n"
end