class ProductCategory < ApplicationRecord
  #
  # TODO
  #   - Add validations
  #

  belongs_to :product
  belongs_to :category
end
