class Category < ApplicationRecord
  #
  # TODO
  #   - Add validations
  #   - Check index and unique constraints
  #
  has_many :product_categories
end
