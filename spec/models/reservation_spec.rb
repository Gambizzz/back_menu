require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe "associations" do
    it { should belong_to(:restaurant) }
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:time) }
  end
end