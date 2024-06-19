class Restaurant < ApplicationRecord
  belongs_to :admin

  validates :name, :description, :city, :food, presence: true
end
