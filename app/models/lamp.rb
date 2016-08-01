class Lamp < ApplicationRecord
    
  has_many :comments, as: :commentable, dependent: :destroy
  
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
    
end
