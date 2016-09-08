class Product < ApplicationRecord
  belongs_to :category
  has_many :images
  has_many :comments
  has_many :rates
  
  accepts_nested_attributes_for :images, :allow_destroy => true
  
  def rate_average
    rates.average(:rate)
  end
  
  def main_image(image_format = :medium)
    return 'http://placekitten.com/50/50' if images.empty?
    images.first.img.url(image_format)
  end
  
end
