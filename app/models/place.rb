class Place < ApplicationRecord
  validates :name, :headline, :description, :price, :address, presence: true
  validates :price, numericality: { greater_than: 0 }

  has_many_attached :images, dependent: :destroy

  geocoded_by :address

  after_validation :geocode

  def default_image
    images.first
  end
end
