class Monster < ApplicationRecord
  has_many :quests, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
