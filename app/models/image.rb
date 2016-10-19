class Image < ApplicationRecord
  
  belongs_to :product

  has_attached_file :img, styles: { large: "500x500", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/
  
  #attr_accessible :image, :image_file_name
end
