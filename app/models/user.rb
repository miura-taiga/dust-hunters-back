class User < ApplicationRecord
  has_many :user_authentications

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :gender, presence: true
  validates :hunterrank, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 999 }

  enum gender: { male: 'male', female: 'female', other: 'other' }
end
