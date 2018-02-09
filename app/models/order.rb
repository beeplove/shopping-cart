class Order < ApplicationRecord
  #
  # TODO
  #   - Validations
  #   - Association with Status
  #   - Association with Lineitem (Items in an Order)
  #

  belongs_to :customer
end
