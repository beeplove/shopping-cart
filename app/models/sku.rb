class Sku < ApplicationRecord
  #
  # TODO
  #   - Add validations
  #     - validation for price, negativity and not too high
  #     - validation for decimal_factor, negativity and not too high
  #   - Add index and unique constraints
  #   - price accessor from price_in_cents
  #

  belongs_to :product
  belongs_to :unit

  has_many :lineitems
end
