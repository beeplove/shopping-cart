class ProductCategory < ApplicationRecord
  #
  # TODO
  #   - Add validations
  #   - Add index and unique constraints
  #

  belongs_to :product
  belongs_to :category
end
