class Comment < ApplicationRecord
    validates :title, presence: true

    has_many :likes

    belongs_to :user, :topic
end