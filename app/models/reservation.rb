class Reservation < ApplicationRecord
  validates :checkin, :checkout, :guests, presence: true

  enum status: {
    pending: 0,
    paid: 1,
    canceled: 2
  }

  belongs_to :place
  belongs_to :user
  
  def total_nights
    (checkout - checkin).to_i
  end

  def total_price
    (total_nights * place.price) + place.cleaning_fee
  end

  def cancelable?
    status == 'paid' && Time.now < checkin
  end
end
