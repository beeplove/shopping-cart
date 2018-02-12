class Lineitem < ApplicationRecord
  #
  # TODO
  #   - Add index and unique constraints
  #

  belongs_to :order
  belongs_to :sku

  before_save :calculate_price_in_cents

  validates :quantity, numericality: { greater_than: 0 }

  validate :decimal_value_of_quantity

  def calculate_price_in_cents
    @price_in_cents = (self.quantity * self.sku.unit_price_in_cents).ceil
  end

  def price_in_cents
    calculate_price_in_cents
    @price_in_cents
  end

  def decimal_value_of_quantity
    value = self.quantity * (10 ** self.sku.decimal_factor)
    errors.add(:quantity, "Please check quantity decimal value") unless value.to_i == value
  end

end
