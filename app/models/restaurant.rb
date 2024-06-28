class Restaurant < ApplicationRecord
  belongs_to :admin
  has_one_attached :photo
  has_one_attached :cover_photo
  has_many :reservations, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  has_many :comments, dependent: :destroy

  validates :name, :description, :city, :food, presence: true

end
