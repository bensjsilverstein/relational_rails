require 'rails_helper'

RSpec.describe 'the dish index page' do

  it "display each dish and their attributes" do
    Foodtruck.destroy_all
    Dish.destroy_all
    foodtruck = Foodtruck.create!(name: "Los Burritos Locos", num_workers: 5, checked_in: false, food_type: "Mexican")
    dish_1 = foodtruck.dishes.create!(dish_name: "El Burrito Grande", price: 13, in_stock: true, foodtruck: foodtruck)
    # dish_2 = foodtruck.dishes.create!(dish_name: "El Taco Grande", price: 5, in_stock: true, foodtruck: foodtruck)
    # dish_3 = foodtruck.dishes.create!(dish_name: "La Chalupa Grande", price: 8, in_stock: true, foodtruck: foodtruck)

    visit "/dishes/#{dish_1.id}"

    expect(page).to have_content(dish_1.dish_name)
    expect(page).to have_content(dish_1.price)
    expect(page).to have_content(dish_1.in_stock)
    # expect(page).to_not have_content(dish_2.dish_name)
    # expect(page).to_not have_content(dish_2.price)
    # expect(page).to_not have_content(dish_2.in_stock)
  end

end
