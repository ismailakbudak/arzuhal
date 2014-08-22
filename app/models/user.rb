class User < ActiveRecord::Base
    
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable
	       
    has_many :tweets 

	# it is a method we can use like this => validates(:name, presence: true)
	validates :name, presence: true, length: { maximum: 50 }
	validates :surname, presence: true, length: { maximum: 50 }   

	# uniqueness: true büyük küçük harf duyarlı değil
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
    def full_name
    	name + surname
    end
end
