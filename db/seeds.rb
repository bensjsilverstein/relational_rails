# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dish.destroy_all
Foodtruck.destroy_all

foodtruck_1 = Foodtruck.create!(name: "Uncle Al's Hotdogs", num_workers: 6, checked_in: true, food_type: "American")
foodtruck_2 = Foodtruck.create!(name: "Aunt Sally's Burgers", num_workers: 5, checked_in: true, food_type: "American")
foodtruck_3 = Foodtruck.create!(name: "Aunt Dolly's Salads", num_workers: 5, checked_in: true, food_type: "Healthy")

dish_1 = foodtruck_1.dishes.create!(dish_name: "The Big Dog", price: 14, in_stock: true)
dish_2 = foodtruck_1.dishes.create!(dish_name: "The Small Dog", price: 6, in_stock: true)
dish_3 = foodtruck_2.dishes.create!(dish_name: "The Big Burg", price: 13, in_stock: true)
dish_4 = foodtruck_2.dishes.create!(dish_name: "The Small Burg", price: 5, in_stock: true)
dish_5 = foodtruck_3.dishes.create!(dish_name: "The Big Salad", price: 10, in_stock: true)
dish_6 = foodtruck_3.dishes.create!(dish_name: "The Small Sally", price: 4, in_stock: true)
