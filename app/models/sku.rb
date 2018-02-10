class Sku < ApplicationRecord
  #
  # TODO
  #   - Add validations
  #     - validation for price, negative and not to high
  #   - Add index and unique constraints
  #   - price accessor from price_in_cents
  #

  belongs_to :product
  belongs_to :unit
end
