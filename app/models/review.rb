class Review < ApplicationRecord
  validates :content, presence: true
  validates :vote, inclusion: { in: [1, 2, 3, 4, 5] }

  belongs_to :user
  belongs_to :place
end
