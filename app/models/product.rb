class Product < ApplicationRecord
  #
  # TODO
  #   - Add validations
  #

  has_many :skus
  has_many :product_categories
end
