class Comment < ApplicationRecord
 belongs_to :product
 belongs_to :user
 
 scope :for_product, ->(product_id) { where(product_id: product_id) }
 
 def to_json
  {id: self.id, comment: self.comment, first_name: self.user.first_name, last_name: self.user.last_name}
 end
end
