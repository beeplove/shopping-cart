class Order < ApplicationRecord
  #
  # TODO
  #   - Validations
  #

  belongs_to :customer
  belongs_to :status

  has_many :lineitems
end
