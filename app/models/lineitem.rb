class Lineitem < ApplicationRecord
  #
  # TODO
  #   - Add validations
  #     - add validation on quanity
  #   - Add index and unique constraints
  #   - Association with Order
  #   - Association with Sku
  #   - quantity to decimal or one more attribute for actual quantity
  #

  belongs_to :order
  belongs_to :sku

  before_save :calculate_price_in_cents


  def calculate_price_in_cents
    # TODO: put actual logic
    self.price_in_cents = 1256
  end
end
