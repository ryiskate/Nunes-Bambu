class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable
           
    has_many :orders
    has_many :comments
    
    validates :first_name, presence: true,
                           length: {minimum: 5}
    
    def get_cart
      order = self.orders.where( status: 'cart' ).first
      order.nil? ? self.orders.new( status: 'cart' ) : order
    end
       
end
