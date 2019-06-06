# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
 10.times do
   Book.create!(title: Faker::Book.title, author: Faker::Book.author, price: Faker::Number.between(1, 10)*100)
 end

Plan.create!(amount: 100, frequency: 1, period: "monthly")
Plan.create!(amount: 200, frequency: 1, period: "monthly")
Plan.create!(amount: 300, frequency: 1, period: "monthly")

10.times do
  price = Faker::Number.decimal(3,2)
  title = Faker::Movie.quote
  MovieTicket.create(price: price, title: title)
end
