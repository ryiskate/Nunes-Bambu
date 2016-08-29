class Product < ApplicationRecord
  belongs_to :category
  has_many :images
  has_many :comments
  has_many :rates
  
  accepts_nested_attributes_for :images, :allow_destroy => true
  
  def rate_average
    rates.average(:rate)
  end
  
end
