class Dish < ApplicationRecord
  validates_presence_of :dish_name
  validates_presence_of :price
  validates :in_stock, inclusion: [true, false]

  belongs_to :foodtruck
end
