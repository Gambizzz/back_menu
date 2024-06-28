require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe "associations" do
    it { should belong_to(:admin) }
    it { should have_one_attached(:photo) }
    it { should have_many(:reservations).dependent(:destroy) }
    it { should have_many(:favorites).dependent(:destroy) }
    it { should have_many(:users).through(:favorites) }
    it { should have_many(:comments).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:food) }
  end
end