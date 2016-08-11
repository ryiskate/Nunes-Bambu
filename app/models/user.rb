class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable
           
    has_many :ordes, as: :ordeable, dependent: :destroy
    
    validates :first_name, presence: true,
                           length: {minimum: 5}
                           

    def admin? 
        self.role == 'admin' 
    end
    
end
