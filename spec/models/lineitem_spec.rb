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

  describe "#price_in_cents" do
    let(:lineitem) { build(:lineitem) }

    it "return price in cents by calculating from unit price of sku" do
      lineitem.quantity = 100
      lineitem.sku.unit_price_in_cents = 10

      expect(lineitem.price_in_cents).to eq(1000)
    end

    it "return price in cents when quantity is decimal" do
      lineitem.quantity = 100.50
      lineitem.sku.unit_price_in_cents = 10
      lineitem.sku.decimal_factor = 1

      expect(lineitem.price_in_cents).to eq(1005)
    end

    it "return price in cents by ceiling up when decimal factor is too high" do
      lineitem.sku.decimal_factor = 3
      lineitem.quantity = 100.517
      lineitem.sku.unit_price_in_cents = 19

      expect(lineitem.price_in_cents).to eq(1910)
    end

  end
  
end
