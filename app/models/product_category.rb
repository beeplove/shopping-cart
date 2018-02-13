class ProductCategory < ApplicationRecord
  #
  # TODO
  #   - Add validations
  #   - Add index and unique constraints
  #     - unique key for product_id and category_id
  #

  belongs_to :product
  belongs_to :category
end
