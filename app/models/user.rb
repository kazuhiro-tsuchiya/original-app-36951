class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,   presence: true
  validates :last_name,  presence: true
  validates :first_name, presence: true
  validates :last_name,  :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :password,   format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  has_many :items
  has_many :purchases
  has_many :teams
end
