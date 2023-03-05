class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 25 }

  has_many :reservations, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :places, foreign_key: 'host_id', dependent: :destroy
  has_one_attached :avatar, dependent: :destroy

  before_create :maybe_set_stripe_costumer_id

  def maybe_set_stripe_costumer_id
    return if stripe_costumer_id.present?

    customer = Stripe::Customer.create({
      email: email,
      name: name,
      metadata: {
        airbnb_id: id
      }
    })
    self.update(stripe_costumer_id: customer.id)
  end
end
