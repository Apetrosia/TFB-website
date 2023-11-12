class Topic < ApplicationRecord
    validates :title, presence: true
    validates :user_id, uniqueness: true

    has_many :comments

    belongs_to :user
    belongs_to :section
end