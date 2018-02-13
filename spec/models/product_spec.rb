require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should have_many(:skus) }
  it { should have_many(:product_categories) }

  describe "#name" do
    it "should not be empty" do
      product = build(:product, name: "")
      expect(product.valid?).to be false
    end
  end
end
