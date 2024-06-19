class Text < ApplicationRecord
    belongs_to :admin
  
    validates :content, presence: true
    validates :admin, presence: true
  end