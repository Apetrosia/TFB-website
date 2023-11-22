class User < ApplicationRecord
    validates :login, :email, :password_digest, presence: true
    validates :login, :email, uniqueness: true

    has_secure_password

    has_many :topics
    has_many :comments
end
