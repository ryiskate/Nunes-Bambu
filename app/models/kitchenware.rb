class Kitchenware < ApplicationRecord
  
  has_many :comments, as: :commentable
  
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  
end
