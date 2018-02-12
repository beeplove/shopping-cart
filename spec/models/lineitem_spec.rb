require 'rails_helper'

# 
# TODO
#   - add coverage for price_in_cents
RSpec.describe Lineitem, type: :model do

  describe "#quantity" do
    let(:lineitem) { build(:lineitem) }

    it "should validate quantity to be greater than 0" do
      lineitem.quantity = 0
      expect(lineitem.valid?).to eq(false)
    end

    it "should validate quantity by taking decimal_factor into consideration" do
      lineitem.quantity = 1.3
      expect(lineitem.valid?).to eq(false)
    end

    it "should return decimal value if decimal_factor has proper value" do
      lineitem.sku.decimal_factor = 2
      lineitem.quantity = 1.32
      expect(lineitem.valid?).to eq(true)
    end

  end

  describe "#price_in_cents"
  
end
