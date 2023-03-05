class Reservation < ApplicationRecord
  validates :checkin, :checkout, :guests, presence: true

  belongs_to :place
  belongs_to :user
  
  def total_nights
    (checkout - checkin).to_i
  end

  def total_price
    (total_nights * place.price) + place.cleaning_fee
  end
end
