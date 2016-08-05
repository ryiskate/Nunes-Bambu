class Lamp < ApplicationRecord
    
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
  
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
    
end
