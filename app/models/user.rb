class User < ActiveRecord::Base
    has_many :videos
    has_many :gifs
    has_secure_password
    validates :email, presence: true, uniqueness: true
end
