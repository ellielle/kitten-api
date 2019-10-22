# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cute = %w(Adorable Lovely Magnificent Incredibly Very Kawaii)
soft = ["As a feather", "Super Floof", "Fleece Blanket", "Hairless", "Purrfect"]

100.times do
  name = Faker::Creature::Cat.name
  age = rand(0..20)
  cuteness = cute[rand(0..5)]
  softness = soft[rand(0..4)]
  Kitten.create(name: name, age: age, cuteness: cuteness, softness: softness)
end