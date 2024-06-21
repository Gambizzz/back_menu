class TextToAdmin < ApplicationRecord
    belongs_to :text
    belongs_to :admin
  
    validates :text, presence: true
    validates :admin, presence: true
  end
  