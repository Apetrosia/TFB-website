class Topic < ApplicationRecord
    validates :title, presence: true
    validates :user_id, uniqueness: true

    has_many :comments
end