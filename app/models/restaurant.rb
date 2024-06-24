class Restaurant < ApplicationRecord
  belongs_to :admin
  has_one_attached :photo
  has_many :reservations, dependent: :destroy

  validates :name, :description, :city, :food, presence: true

end
