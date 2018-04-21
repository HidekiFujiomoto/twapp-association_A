class Mutter < ApplicationRecord
    validates :content,
    presence: true,
    length: { in: 1..140 }

    # アソシエーション設定一対多の多側
    belongs_to :user

    # アソシエーション設定多対多の多側
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
end
