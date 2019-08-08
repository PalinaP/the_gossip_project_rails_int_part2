# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# creation of 5 cities

City.destroy_all
city_array = []
City.create(name:"Marseille", zip_code:"13000")
City.create(name:"Montpellier", zip_code:"34000")
City.create(name:"Toulouse", zip_code:"31000")
City.create(name:"La Rochelle", zip_code:"17000")
City.create(name:"Toulon", zip_code:"83000")
City.all.each do |c|
  city_array << c.id
end

puts "5 cities have been created"

# creation of 10 users (belongs_to city)
User.destroy_all
user_array = []
10.times do
  u = User.create(
    first_name:Faker::Name.first_name,
    last_name:Faker::Name.last_name,
    city_id: city_array.sample,
    description:" ",
    email:Faker::Internet.email,
    age:rand(18..100),
    password:Faker::Alphanumeric.alpha(number: 10)
  )
user_array << u.id
end

puts "10 users have been created"

# creation of 30 gossips (belongs_to author)
Gossip.destroy_all
gossip_array = []
30.times do
  g = Gossip.create(
    title:Faker::Book.title,
    content:Faker::Movie.quote,
    author_id: user_array.sample
  )
gossip_array << g.id
end

puts "30 gossips have been created"



# creation of 20 comments
Comment.destroy_all
20.times do
  Comment.create(
    content:Faker::Movie.quote,
    gossip_id:gossip_array.sample,
    commentator_id:user_array.sample,
  )
end

puts "20 comments have been created"
