class Restaurant < ApplicationRecord
  belongs_to :admin
  has_one_attached :photo
  has_many :reservations, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  validates :name, :description, :city, :food, presence: true

end
