class Quest < ApplicationRecord
  belongs_to :monster

  has_many :user_quests
  has_many :users, through: :user_quests

  validates :title, presence: true, uniqueness: true
end
