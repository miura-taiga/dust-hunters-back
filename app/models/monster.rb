class Monster < ApplicationRecord
  has_many :quests, dependent: :destroy
  has_many :guild_cards

  validates :name, presence: true, uniqueness: true
  validates :body, presence: true
end
