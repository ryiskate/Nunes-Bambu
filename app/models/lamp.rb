class Lamp < ApplicationRecord
    
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
  
  accepts_nested_attributes_for :images, allow_destroy: true
  
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
    
end
