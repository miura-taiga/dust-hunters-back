class GuildCard < ApplicationRecord
  belongs_to :user
  belongs_to :monster
  belongs_to :quest, optional: true

  validates :defeat_count, numericality: { greater_than_or_equal_to: 0 }
end
