require 'open-uri'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :omniauthable, omniauth_providers: [:google, :github]

  validates :first_name, presence: true, length: { maximum: 25 }

  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :places, foreign_key: 'host_id', dependent: :destroy
  has_one_attached :avatar, dependent: :destroy

  after_create :maybe_set_stripe_customer_id

  def name
    "#{first_name} #{last_name}"
  end

  def maybe_set_stripe_customer_id
    return if stripe_customer_id.present?

    customer = Stripe::Customer.create({
      email: email,
      name: name,
      metadata: {
        airbnb_id: id
      }
    })
    self.update(stripe_customer_id: customer.id)
  end

  def self.from_omniauth(access_token)
    user = User.where(email: access_token.info.email).first

    unless user
      user = User.create!(
        first_name: access_token.info.name,
        email: access_token.info.email,
        password: Devise.friendly_token[0,20]
      )
      downloaded_image = URI.parse(access_token.info.image).open
      user.avatar.attach(io: downloaded_image, filename: "avatar_#{user.id}.jpg")
    end

    user
  end
end
