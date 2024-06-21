class Restaurant < ApplicationRecord
  belongs_to :admin

  has_many :reservations, dependent: :destroy
  validates :name, :description, :city, :food, presence: true

  has_one_attached :photo
end
