class Comment < ApplicationRecord
    validates :title, presence: true

    has_many :likes

    belongs_to :user
    belongs_to :topic
end