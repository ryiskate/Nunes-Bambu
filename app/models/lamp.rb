class Lamp < ApplicationRecord
    
    has_many :comments, as: :commentable
    
    validates :name, presence: true,
                     length: {minimum: 5}
    
end
