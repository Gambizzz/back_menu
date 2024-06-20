class Admin < ApplicationRecord
  has_many :text_to_admins
  has_many :texts, through: :text_to_admins
  has_many :reservations, through: :restaurants 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  
  has_many :restaurants, dependent: :destroy
end
