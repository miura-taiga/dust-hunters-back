class User < ApplicationRecord
  has_many :user_authentications
  has_many :user_quests
  has_many :quests, through: :user_quests
  has_many :guild_cards, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :name, length: { maximum: 10 }, presence: true
  validates :gender, presence: true
  validates :hunterrank, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 999 }

  enum gender: { male: 'male', female: 'female', other: 'other' }
end
