class Quest < ApplicationRecord
  belongs_to :monster
  has_many :guild_cards

  has_many :user_quests
  has_many :users, through: :user_quests
  has_many :defeated_records, dependent: :destroy

  validates :title, presence: true, uniqueness: true
end
