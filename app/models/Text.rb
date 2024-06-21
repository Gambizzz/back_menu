class Text < ApplicationRecord
  has_many :text_to_admins
  has_many :admins, through: :text_to_admins

  validates :content, presence: true
end
