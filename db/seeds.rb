# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Admin",
             email: "admin@admin.admin",
             password: "1;r2;r3;r777",
             password_confirmation: "1;r2;r3;r777",
             admin: true,
             confirmed_at: Time.zone.now)

6.times do |n|
  name = Faker::Name.name
  email = "cus#{n+1}@test.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               confirmed_at: Time.zone.now)
end


array = []
10.times do |n|
  array << Faker::Ancient.god
end

30.times do |n|
  name = Faker::Name.name
  category = array.shuffle.first
  description = Faker::Food.description
  price = rand(100)
  Item.create!(name: name,
               description: description,
               category:category,
               price: price,
               active: true)
end


OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Ordered"
OrderStatus.create! id: 3, name: "Picked Up"
OrderStatus.create! id: 4, name: "Cancelled"
OrderStatus.create! id: 5, name: "Abandoned"

# 99.times do |n|
#  name = Faker::Name.name
#  email = "example-#{n+1}@railstutorial.org"
#  password = "password"
#  User.create!(name: name,
#               email: email,
#               password: password,
#               password_confirmation: password)
#end
#
#users = User.order(:created_at).take(6)
#50.times do
#  content = Faker::Lorem.sentence(5)
#  users.each { |user| user.microposts.create!(content: content) }
#end
