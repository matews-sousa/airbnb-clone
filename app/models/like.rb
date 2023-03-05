class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: :place_id }
  belongs_to :user
  belongs_to :place
end
