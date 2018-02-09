class Status < ApplicationRecord
  #
  # TODO
  #   - Validation
  #   - Index and Unique keys
  #

  has_many :ordres
end
