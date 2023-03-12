class Review < ApplicationRecord
  validates :content, presence: true
  validates :vote, numericality: { in: 1..5 }, presence: true

  belongs_to :user
  belongs_to :place
end 