# Admin
User.create!(name: "Admin",
             email: "admin@admin.admin",
             password: "1;r2;r3;r777",
             password_confirmation: "1;r2;r3;r777",
             admin: true,
             confirmed_at: Time.zone.now)

# First Ten Fake User
10.times do |n|
  name = Faker::Name.name
  email = "cus#{n+1}@test.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               confirmed_at: Time.zone.now)
end

# Fake Item Categories
array = []
10.times do |n|
  array << Faker::Ancient.god
end

# Fake Items
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

# Fake Orders
100.times do |n|
  xorder = Order.new
  xorder.order_status_id = 1
  xorder.order_items.new(item_id: rand(29)+1,
                         quantity: rand(5)+1)
  xorder.save
  while (rand(19683)%3 == 0) do
    xorder.order_items.new(item_id: rand(29)+1,
                           quantity: rand(5)+1)
    xorder.save
  end
  xorder.pickup_time = Time.zone.now + rand(10).hours + rand(60).minutes - 5.hours - 30.minutes
  xorder.user_id = rand(9)+1
  xorder.order_status_id = 2
  xorder.save
end

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
