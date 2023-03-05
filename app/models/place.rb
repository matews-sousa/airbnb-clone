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
end
