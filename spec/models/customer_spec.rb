require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should have_many(:orders) }

  describe "#first_name" do
    it "should not be empty" do
      customer = build(:customer, first_name: "")

      expect(customer.valid?).to be false
    end
  end
end
