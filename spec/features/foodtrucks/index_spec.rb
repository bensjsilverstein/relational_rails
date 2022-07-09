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
    save_and_open_page
  end

end
