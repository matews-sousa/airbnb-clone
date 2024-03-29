class Place < ApplicationRecord
  validates :name, 
    :headline,
    :description,
    :price,
    :cleaning_fee,
    :max_guests,
    :rooms,
    :beds,
    :baths,
    :min_reservation_days,
    :address_1,
    presence: true
  validates :price,
    :max_guests,
    :rooms,
    :beds,
    :baths,
    :min_reservation_days,
    numericality: { greater_than: 0 }

  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :host, class_name: 'User'
  has_many_attached :images, dependent: :destroy

  geocoded_by :address

  after_validation :geocode

  def address
    [address_1, address_2, city, state, postal_code, country].compact.join(', ')
  end

  def default_image
    images.first
  end

  def user_is_guest?(user)
    reservations.where(user: user).any?
  end
  
  def user_already_reviewed?(user)
    reviews.where(user: user).any?
  end

  def reviewable_by?(user)
    user_is_guest?(user) && !user_already_reviewed?(user) && reservations.where(user: user).last.checkout < Date.today
  end


  def average_vote
    reviews.average(:vote).to_i
  end

  def first_available_date
    # if there are no reservations, return today
    paid_reservations = reservations.where(status: :paid)

    return Date.today if paid_reservations.empty?

    # if there are reservations, return the first available date
    paid_reservations.order(:checkout).last.checkout + 1
  end

  def unavaible_dates
    reservations.where(status: :paid).order(:checkin).map do |reservation|
      if reservation.checkin >= Date.today
        { from: reservation.checkin, to: reservation.checkout }
      end
    end
  end
end
