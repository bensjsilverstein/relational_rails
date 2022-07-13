require 'rails_helper'

RSpec.describe 'Edit Dish' do

  it 'can update tree' do
    foodtruck = Foodtruck.create!(name: "Pizza Shack", num_workers: 32, checked_in: true, food_type: "Italian")
    dish_1 = foodtruck.dishes.create!(dish_name: "Sausage, pepper & onion", price: 6, in_stock: true)
    visit "/dishes/#{dish_1.id}/edit"
    fill_in 'Dish name', with: 'Sausage & onion'
    fill_in 'Price', with: 5
    select 'In stock', from: 'in_stock'
    click_button 'Update Dish'

    expect(current_path).to eq("/dishes/#{dish_1.id}")
    expect(page).to have_content('Sausage & onion')
    expect(page).to have_content(5)
  end
end
