class Dish < ApplicationRecord
  validates_presence_of :dish_name
  validates_presence_of :price
  validates :in_stock, inclusion: [true, false]

  belongs_to :foodtruck

  def self.alphabetical
    order(:dish_name)
  end

  def self.in_stock?
    where(in_stock: true)
  end

end
