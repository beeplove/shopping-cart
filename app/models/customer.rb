class Customer < ApplicationRecord
  # TODO:
  #   - add validation for first_name
  #   - add index

  has_many :orders
end
