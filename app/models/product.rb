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
  
  def images_url
    images.map{
     |i|
      ind = i.img.url(:large).index('?')
      i.img.url(:large)[0,ind]
    }
    
    #['/system/images/imgs/000/000/008/medium/mulher.jpg','/system/images/imgs/000/000/009/medium/bike.jpg','/system/images/imgs/000/000/010/medium/caminho.jpg']
  end
  
end
