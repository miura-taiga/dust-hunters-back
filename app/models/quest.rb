class Quest < ApplicationRecord
  belongs_to :monster

  validates :title, presence: true, uniqueness: true
end
