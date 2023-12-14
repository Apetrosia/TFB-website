class Comment < ApplicationRecord
    validates :title, presence: true

    has_many :likes, dependent: :destroy

    belongs_to :user
    belongs_to :topic
end