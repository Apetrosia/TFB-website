class User < ApplicationRecord
    validates :login, :email, :password_digest, presence: true
    validates :login, :email, uniqueness: true
    validates_format_of :email, :with => /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i, on: :create

    has_secure_password

    has_many :topics
    has_many :comments

    has_one_attached :avatar
    validate :correct_avatar_file_type
    validate :acceptable_image_size
    def correct_pfp_file_type
        if avatar.attached? && !avatar.content_type.in?(%w(image/jpeg image/png))
            errors.add(:avatar, 'Файл должен быть в формате JPEG или PNG')
        end
    end

    def acceptable_image_size
        if avatar.attached? && avatar.byte_size > 1.megabyte
            errors.add(:avatar, 'Файл слишком большой')
        end
    end
end
