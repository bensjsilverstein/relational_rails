require 'rails_helper'

RSpec.describe 'the foodtrucks show page' do
  it "displays the foodtruck with its id and its attributes" do
    foodtruck = Foodtruck.create!(name: "Big City Burrito", num_workers: 6, checked_in: false, food_type: "Mexican")
    foodtruck_1 = Foodtruck.create!(name: "Los Amigos Locos", num_workers: 3, checked_in: true, food_type: "Dominican")

    visit "/foodtrucks/#{foodtruck.id}"

    expect(page).to have_content(foodtruck.name)
    expect(page).to have_content(foodtruck.num_workers)
    expect(page).to have_content(foodtruck.checked_in)
    expect(page).to have_content(foodtruck.food_type)
    expect(page).to_not have_content(foodtruck_1.name)
    expect(page).to_not have_content(foodtruck_1.num_workers)
    expect(page).to_not have_content(foodtruck_1.checked_in)
    expect(page).to_not have_content(foodtruck_1.food_type)
  end

end
