require 'rails_helper'
describe Dish, type: :model do
  describe "validations" do
    it { should validate_presence_of :dish_name }
    it { should validate_presence_of :price }
    it { should allow_value(true).for(:in_stock) }
    it { should allow_value(false).for(:in_stock) }
  end

  describe "relationships" do
   it { should belong_to :foodtruck }
  end
end
