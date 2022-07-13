require 'rails_helper'

RSpec.describe 'New Foodtruck' do
  describe 'As a visitor' do
    describe 'When I visit the new foodtruck form by clicking a link on the index' do
      it 'I can create a new foodtruck' do
        visit '/foodtrucks'

        click_link 'New Foodtruck'

        expect(current_path).to eq('/foodtrucks/new')

        fill_in 'Name', with: 'Larry Sandwiches'
        fill_in 'Num workers', with: 9
        select 'Checked in', from: 'checked_in'
        fill_in 'Food type', with: "Sandwiches"
        click_on 'Create Foodtruck'

        expect(current_path).to eq("/foodtrucks")
        expect(page).to have_content('Larry Sandwiches')
      end
    end
  end
end
