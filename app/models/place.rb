class Place < ApplicationRecord
  validates :name, :headline, :description, :price, :cleaning_fee, :address_1, presence: true
  validates :price, numericality: { greater_than: 0 }

  belongs_to :host, class_name: 'User'
  has_many_attached :images, dependent: :destroy

  geocoded_by :address

  after_validation :geocode

  def address
    [:address_1, :address_2, :city, :state, :postal_code, :country].compact.join(', ')
  end

  def default_image
    images.first
  end
end
