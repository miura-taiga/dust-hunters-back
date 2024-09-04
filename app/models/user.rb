class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :gender, presence: true
  validates :hunterrank, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 999 }

  enum gender: { male: 'male', female: 'female', other: 'other' }
end
