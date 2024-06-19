class Restaurant < ApplicationRecord
  belongs_to :admin

  validates :name, :description, presence: true
end
