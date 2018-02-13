class Product < ApplicationRecord
  has_many :skus
  has_many :product_categories

  validates :name, presence: true
end
