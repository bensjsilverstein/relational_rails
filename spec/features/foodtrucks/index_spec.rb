# User Story 1, Parent Index
#
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
require 'rails_helper'

RSpec.describe 'the foodtruck index page' do

  it "display names of each parent(foodtruck)" do
    Foodtruck.destroy_all
    foodtruck = Foodtruck.create!(name: "Uncle Al's Hotdogs", num_workers: 6, checked_in: true, food_type: "American")
    visit '/foodtrucks'

    expect(page).to have_content(foodtruck.name)
    # save_and_open_page
  end

  it "sorts foodtrucks by most recenetly created" do
    Foodtruck.destroy_all
    foodtruck_1 = Foodtruck.create!(name: "Uncle Al's Hotdogs", num_workers: 6, checked_in: true, food_type: "American")
    foodtruck_2 = Foodtruck.create!(name: "Aunt Sally's Burgers", num_workers: 5, checked_in: true, food_type: "American")
    foodtruck_3 = Foodtruck.create!(name: "Aunt Dolly's Salads", num_workers: 5, checked_in: true, food_type: "Healthy")
    visit '/foodtrucks'

    expect(foodtruck_1.name).to appear_before(foodtruck_2.name)
    expect(foodtruck_1.name).to appear_before(foodtruck_3.name)
    expect(foodtruck_2.name).to appear_before(foodtruck_3.name)
  end

  it "has a link to the foodtrucks index" do
    Foodtruck.destroy_all
    Dish.destroy_all
    foodtruck_1 = Foodtruck.create!(name: "Uncle Al's Hotdogs", num_workers: 6, checked_in: true, food_type: "American")
    dish_1 = foodtruck_1.dishes.create!(dish_name: "El Burrito Grande", price: 13, in_stock: true, foodtruck: foodtruck_1)

    visit '/foodtrucks'
    click_link 'Foodtrucks'

    expect(page).to have_link("Foodtrucks", :href =>"/foodtrucks")
    expect(page).to have_link("Dishes", :href =>"/dishes")

  end

  it "has a link to the dishes index" do
    Foodtruck.destroy_all
    Dish.destroy_all
    foodtruck_1 = Foodtruck.create!(name: "Uncle Al's Hotdogs", num_workers: 6, checked_in: true, food_type: "American")
    dish_1 = foodtruck_1.dishes.create!(dish_name: "El Burrito Grande", price: 13, in_stock: true, foodtruck: foodtruck_1)

    visit '/foodtrucks'
    click_link 'Dishes'

    expect(page).to have_link("Dishes", :href =>"/dishes")
    expect(page).to have_link("Foodtrucks", :href =>"/foodtrucks")
  end

  it "has an edit link next to every foodtruck" do
    Dish.destroy_all
    Foodtruck.destroy_all
    foodtruck_1 = Foodtruck.create!(name: "Al's Taco Stand", num_workers: 1, checked_in: true, food_type: "Tacos")
    foodtruck_2 = Foodtruck.create!(name: "Bill's Taco Stand", num_workers: 1, checked_in: true, food_type: "Tacos")

    visit '/foodtrucks'
    within "#foodtruck-#{foodtruck_1.id}" do
    expect(page).to have_link("Edit")
      click_on "Edit"
      expect(current_path).to eq("/foodtrucks/#{foodtruck_1.id}/edit")
    end
    visit '/foodtrucks'
    within "#foodtruck-#{foodtruck_2.id}" do
    expect(page).to have_link("Edit")
      click_on "Edit"
      expect(current_path).to eq("/foodtrucks/#{foodtruck_2.id}/edit")
    end
  end

end
