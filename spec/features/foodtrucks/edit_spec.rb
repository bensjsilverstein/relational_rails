
require 'rails_helper'

RSpec.describe 'Edit Foodtruck' do

  it 'can update a foodtruck' do
    foodtruck = Foodtruck.create!(name: "The Soup Wagon", num_workers: 15, checked_in: false, food_type: "Soup")
    visit "/foodtrucks/#{foodtruck.id}/edit"
    fill_in 'Name', with: 'The Salad Wagon'
    fill_in 'Num workers', with: 14
    select 'Checked in', from: 'checked_in'
    fill_in 'Food type', with: "Salads"
    click_button 'Update Foodtruck'

    expect(current_path).to eq("/foodtrucks/#{foodtruck.id}")
    expect(page).to have_content('The Salad Wagon')
    expect(page).to have_content(14)
    expect(page).to have_content('checked in for the event: true')
    expect(page).to have_content('Salads')
    
  end
end
