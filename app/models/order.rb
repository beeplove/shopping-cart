class Order < ApplicationRecord
  #
  # TODO
  #   - Validations
  #   - Association with Lineitem (Items in an Order)
  #

  belongs_to :customer
  belongs_to :status

  has_many :lineitems
end
