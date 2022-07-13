class Foodtruck < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :num_workers
  validates :checked_in, inclusion: [true, false]
  validates_presence_of :food_type

  has_many :dishes
end

def self.order_by_create
  order(created_at: :asc)
end
