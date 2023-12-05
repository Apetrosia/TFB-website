class User < ApplicationRecord
    validates :login, :email, :password_digest, presence: true
    validates :login, :email, uniqueness: true
    validates_format_of :email, :with => /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i, on: :create

    has_secure_password

    has_many :topics
    has_many :comments
end
