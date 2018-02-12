class Lineitem < ApplicationRecord
  #
  # TODO
  #   - Add validations
  #     - add validation on quanity
  #     - add before save validation to validate quantity by taking sku.decimal_factor into consideratio
  #   - Add index and unique constraints
  #   - Association with Order
  #   - Association with Sku
  #

  belongs_to :order
  belongs_to :sku

  before_save :calculate_price_in_cents


  def calculate_price_in_cents
    # TODO: put actual logic
    self.price_in_cents = 1256
  end
end
