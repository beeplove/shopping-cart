class Order < ApplicationRecord
  #
  # TODO
  #   - Validations
  #   - Add total_price
  #

  belongs_to :customer
  belongs_to :status

  has_many :lineitems
end
