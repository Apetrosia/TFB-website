class User < ApplicationRecord
    validates :login, :email, :password, presence: true
    validates :login, :email, uniqueness: true

    has_many :topics, :massages
end
