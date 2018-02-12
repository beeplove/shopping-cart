require 'rails_helper'

RSpec.describe Sku, type: :model do
  let(:sku) { build(:sku) }
  describe "#unit_price_in_cents" do
    it "should validate unit price to be greater than 0" do
      sku.unit_price_in_cents = 0
      expect(sku.valid?).to eq(false)
    end

  end

  describe "#decimal_factor" do
    it "should validate decimal factor anywhere between 0 and 3" do
      sku.decimal_factor = 0
      expect(sku.valid?).to eq(true)

      sku.decimal_factor = 2
      expect(sku.valid?).to eq(true)

      sku.decimal_factor = 4
      expect(sku.valid?).to eq(false)
    end

  end
end
