class Monster < ApplicationRecord
  has_many :quests, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :body, presence: true
end
