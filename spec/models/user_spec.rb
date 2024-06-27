require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:reservations).dependent(:destroy) }
    it { should have_many(:favorites).dependent(:destroy) }
    it { should have_many(:restaurants).through(:favorites) }
    it { should have_many(:comments).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }
  end
end