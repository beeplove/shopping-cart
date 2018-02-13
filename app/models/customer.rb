class Customer < ApplicationRecord
  # TODO:
  #   - add index

  has_many :orders
  validates :first_name, presence: true
end
