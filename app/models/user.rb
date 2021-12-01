class User < ApplicationRecord
    has_many :playdates
    has_many :reviews, through: :playdates
    
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :password, length: {minimum: 6, message:"Weak Password!"}
end
