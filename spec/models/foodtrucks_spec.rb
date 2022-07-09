require 'rails_helper'
describe Foodtruck, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :num_workers }
    it { should allow_value(true).for(:checked_in) }
    it { should allow_value(false).for(:checked_in) }
    it { should validate_presence_of :food_type }
  end

  describe "relationships" do
   it { should have_many :dishes }
  end
end
