require 'rails_helper'

RSpec.describe 'the dish index page' do

  it "display each dish and their attributes" do
    Foodtruck.destroy_all
    Dish.destroy_all
    foodtruck = Foodtruck.create!(name: "Los Burritos Locos", num_workers: 5, checked_in: false, food_type: "Mexican")
    dish_1 = foodtruck.dishes.create!(dish_name: "El Burrito Grande", price: 13, in_stock: true, foodtruck: foodtruck)
    dish_2 = foodtruck.dishes.create!(dish_name: "El Taco Grande", price: 5, in_stock: true, foodtruck: foodtruck)
    dish_3 = foodtruck.dishes.create!(dish_name: "La Chalupa Grande", price: 8, in_stock: true, foodtruck: foodtruck)
    visit '/dishes'

    expect(page).to have_content(dish_1.dish_name)
    expect(page).to have_content(dish_1.price)
    expect(page).to have_content(dish_1.in_stock)
    expect(page).to have_content(dish_2.dish_name)
    expect(page).to have_content(dish_2.price)
    expect(page).to have_content(dish_2.in_stock)
    expect(page).to have_content(dish_3.dish_name)
    expect(page).to have_content(dish_3.price)
    expect(page).to have_content(dish_3.in_stock)
  end

  it "has a link to the foodtrucks index" do
    Foodtruck.destroy_all
    Dish.destroy_all
    foodtruck_1 = Foodtruck.create!(name: "Uncle Al's Hotdogs", num_workers: 6, checked_in: true, food_type: "American")
    dish_1 = foodtruck_1.dishes.create!(dish_name: "El Burrito Grande", price: 13, in_stock: true, foodtruck: foodtruck_1)

    visit '/foodtrucks'
    click_link 'Foodtrucks'

    expect(page).to have_link("Foodtrucks", :href =>"/foodtrucks")
  end

  it "has a link to the dishes index" do
    Foodtruck.destroy_all
    Dish.destroy_all
    foodtruck_1 = Foodtruck.create!(name: "Uncle Al's Hotdogs", num_workers: 6, checked_in: true, food_type: "American")
    dish_1 = foodtruck_1.dishes.create!(dish_name: "El Burrito Grande", price: 13, in_stock: true, foodtruck: foodtruck_1)

    visit '/foodtrucks'
    click_link 'Dishes'

    expect(page).to have_link("Dishes", :href =>"/dishes")
  end

  it "the dish index shows only 'true' records" do
    Dish.destroy_all
    Foodtruck.destroy_all
    foodtruck_1 = Foodtruck.create!(name: "Uncle Al's Hotdogs", num_workers: 6, checked_in: true, food_type: "American")
    dish_1 = foodtruck_1.dishes.create!(dish_name: "The Grande Dog", price: 13, in_stock: true, foodtruck: foodtruck_1)
    dish_2 = foodtruck_1.dishes.create!(dish_name: "The Spicy Dog", price: 12, in_stock: false, foodtruck: foodtruck_1)
    dish_3 = foodtruck_1.dishes.create!(dish_name: "The Small Dog", price: 11, in_stock: true, foodtruck: foodtruck_1)

    visit '/dishes'

    expect(page).to have_content(dish_1.dish_name)
    expect(page).to have_content(dish_3.dish_name)
    expect(page).to_not have_content(dish_2.dish_name)
  end
  it "has an edit link next to every foodtruck" do
    Dish.destroy_all
    Foodtruck.destroy_all
    foodtruck_1 = Foodtruck.create!(name: "Al's Taco Stand", num_workers: 1, checked_in: true, food_type: "Tacos")
    dish_1 = foodtruck_1.dishes.create!(dish_name: "Beef Taco", price: 2, in_stock: true)
    dish_2 = foodtruck_1.dishes.create!(dish_name: "Chicken Taco", price: 2, in_stock: true)

    visit '/dishes'
    within "#dish-#{dish_1.id}" do
    expect(page).to have_link("Edit")
      click_on "Edit"
      expect(current_path).to eq("/dishes/#{dish_1.id}/edit")
    end
    visit '/dishes'
    within "#dish-#{dish_2.id}" do
    expect(page).to have_link("Edit")
      click_on "Edit"
      expect(current_path).to eq("/dishes/#{dish_2.id}/edit")
    end
  end

end
