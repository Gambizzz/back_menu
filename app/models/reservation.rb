class Reservation < ApplicationRecord
    after_create :reservation_send
    before_destroy :cancel_send
  
    belongs_to :restaurant
    belongs_to :user
  
  
    validates :number, presence: true
    validates :date, presence: true
    validates :time, presence: true
  
    def reservation_send
      UserMailer.reservation_email(self).deliver_now
      AdminMailer.reservation_email(self).deliver_now
    end
  
    def cancel_send
      UserMailer.cancel_email(self.user, self).deliver_now
      AdminMailer.cancel_email(self.restaurant.admin.email, self).deliver_now
    end
  end