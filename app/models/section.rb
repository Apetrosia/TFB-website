class Section < ApplicationRecord
    validates :section, presence: true

    has_many :topics, dependent: :destroy
end