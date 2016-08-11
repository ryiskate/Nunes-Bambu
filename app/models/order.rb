class Order < ApplicationRecord
  belongs_to :ordeable, polymorphic: true
  
  has_many :lamps, as: :lampable
  has_many :kitchenwares, as: :kitchenwareable
  
end
