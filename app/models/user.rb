class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_save { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # アソシエーション設定一対多の一側
  has_many :mutters, dependent: :destroy
  # アソシエーション設定多対多の多側
  has_many :favorites, dependent: :destroy
  has_many :favorites_mutters, through: :favorites, source: :mutter
end
