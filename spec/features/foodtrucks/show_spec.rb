require 'rails_helper'

RSpec.describe 'the foodtrucks show page' do
  it "displays the foodtruck with its id and its attributes" do
    Foodtruck.destroy_all
    foodtruck = Foodtruck.create!(name: "Big City Burrito", num_workers: 6, checked_in: false, food_type: "Mexican")
    foodtruck_1 = Foodtruck.create!(name: "Los Amigos Locos", num_workers: 7, checked_in: true, food_type: "Dominican")

    visit "/foodtrucks/#{foodtruck.id}"

    expect(page).to have_content(foodtruck.name)
    expect(page).to have_content(foodtruck.num_workers)
    expect(page).to have_content(foodtruck.checked_in)
    expect(page).to have_content(foodtruck.food_type)
    expect(page).to_not have_content(foodtruck_1.name)
  end

  it "displays the foodtruck with its id and its attributes" do
    Foodtruck.destroy_all
    Dish.destroy_all
    foodtruck = Foodtruck.create!(name: "Big City Burrito", num_workers: 6, checked_in: false, food_type: "Mexican")
    foodtruck_1 = Foodtruck.create!(name: "Los Amigos Locos", num_workers: 3, checked_in: true, food_type: "Dominican")
    dish_1 = foodtruck.dishes.create!(dish_name: "El Burrito Grande", price: 13, in_stock: true, foodtruck: foodtruck)
    dish_2 = foodtruck.dishes.create!(dish_name: "El Taco Grande", price: 5, in_stock: true, foodtruck: foodtruck)
    dish_3 = foodtruck.dishes.create!(dish_name: "La Chalupa Grande", price: 8, in_stock: true, foodtruck: foodtruck)
    visit "/foodtrucks/#{foodtruck.id}"

    expect(page).to have_content("number of dishes: 3")
  end

  it "has a link to the foodtruck's dishes" do
    Foodtruck.destroy_all
    Dish.destroy_all
    foodtruck = Foodtruck.create!(name: "Uncle Al's Hotdogs", num_workers: 6, checked_in: true, food_type: "American")
    dish_1 = foodtruck.dishes.create!(dish_name: "The Big Dog", price: 13, in_stock: true)
    dish_2 = foodtruck.dishes.create!(dish_name: "The Small Dog", price: 6, in_stock: true)

    visit "/foodtrucks/#{foodtruck.id}"

    expect(page).to have_link("Foodtruck Dishes", :href =>"/foodtrucks/#{foodtruck.id}/dishes")
    click_link 'Foodtruck Dishes'
    expect(current_path).to eq("/foodtrucks/#{foodtruck.id}/dishes")
  end
  it "can delete a foodtruck" do
    Dish.destroy_all
    Foodtruck.destroy_all
    foodtruck = Foodtruck.create!(name: "Uncle Sal's Hotdogs", num_workers: 6, checked_in: true, food_type: "American")
    dish_1 = foodtruck.dishes.create!(dish_name: "The Big Dog", price: 13, in_stock: true)
    dish_2 = foodtruck.dishes.create!(dish_name: "The Small Dog", price: 6, in_stock: true)
    visit "/foodtrucks/#{foodtruck.id}"

    expect(page).to have_content(foodtruck.name)
    expect(page).to have_link("Delete Foodtruck", :href =>"/foodtrucks/#{foodtruck.id}")

    click_link 'Delete Foodtruck'
    expect(current_path).to eq("/foodtrucks")

    expect(page).to_not have_content(foodtruck.name)
  end

end
