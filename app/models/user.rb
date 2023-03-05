class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 25 }

  has_many :favorites, dependent: :destroy
  has_many :places, foreign_key: 'host_id', dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
end
