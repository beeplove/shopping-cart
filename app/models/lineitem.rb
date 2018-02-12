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

  validates :quantity, numericality: { greater_than: 0 }

  validate :decimal_value_of_quantity

  def calculate_price_in_cents
    # TODO: put actual logic
    self.price_in_cents = 1256
  end

  def decimal_value_of_quantity
    value = self.quantity * (10 ** self.sku.decimal_factor)
    errors.add(:quantity, "Please check quantity decimal value") unless value.to_i == value
  end
end
