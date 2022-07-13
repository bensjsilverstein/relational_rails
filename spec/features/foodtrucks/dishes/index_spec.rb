require 'rails_helper'

RSpec.describe 'the foodtruck index page' do

  it "display names of each parent(foodtruck)" do
    Foodtruck.destroy_all
    Dish.destroy_all
    foodtruck = Foodtruck.create!(name: "Los Burritos Locos", num_workers: 5, checked_in: false, food_type: "Mexican")
    dish_1 = foodtruck.dishes.create!(dish_name: "El Burrito Grande", price: 13, in_stock: true, foodtruck: foodtruck)
    dish_2 = foodtruck.dishes.create!(dish_name: "El Taco Grande", price: 5, in_stock: true, foodtruck: foodtruck)
    visit "/foodtrucks/#{foodtruck.id}/dishes"

    expect(page).to have_content(dish_1.dish_name)
    expect(page).to have_content(dish_1.price)
    expect(page).to have_content(dish_2.in_stock)
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

  it 'has link to create new dish' do
    # dish = Dish.create!(dish_name: "Salad Fingers", price: 100, in_stock: false)
    foodtruck = Foodtruck.create!(name: "Yogurt Hut", num_workers: 1, checked_in: false, food_type: "Dessert")
    visit "/foodtrucks/#{foodtruck.id}/dishes"
    expect(page).to have_link('Create Dish')
    click_link 'Create Dish'
    expect(current_path).to eq("/foodtrucks/#{foodtruck.id}/dishes/new")
  end

  it 'can sort dishes alphabetically' do
    foodtruck = Foodtruck.create!(name: "Sausage Cart", checked_in: true, num_workers: 123, food_type: "Sausages")
    dish_1 = foodtruck.dishes.create!(dish_name: "Jalapeno Cheddar", in_stock: true, price: 6)
    dish_2 = foodtruck.dishes.create!(dish_name: "Beer Bratwurst", in_stock: true, price: 6)
    visit "/foodtrucks/#{foodtruck.id}/dishes"

    expect(dish_1.dish_name).to appear_before(dish_2.dish_name)
    click_link "Sort Alphabetically"
    # expect(current_path).to eq("foodtrucks/#{foodtruck.id}/dishes?sort=alpha")

    expect(dish_2.dish_name).to appear_before(dish_1.dish_name)
  end
end
