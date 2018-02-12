class Sku < ApplicationRecord
  #
  # TODO
  #   - Add validations
  #   - Add index and unique constraints
  #   - price accessor from price_in_cents
  #

  belongs_to :product
  belongs_to :unit

  # TODO: for now keeping maximum unit price to 1,000,000 cents
  validates :unit_price_in_cents, inclusion: { in: 1..1_000_000 }

  # TODO: For now keeping decimal up to one-thousandth
  validates :decimal_factor, inclusion: { in: 0..3 }


  has_many :lineitems
end
