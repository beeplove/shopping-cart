class Product < ApplicationRecord
  #
  # TODO
  #   - Add validations
  #   - Add index and unique constraints
  #   - Association with Lineitem
  #   - Association with ProductCategory
  #

  has_many :skus
  has_many :product_categories
end
