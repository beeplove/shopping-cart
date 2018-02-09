class AddStatusIdToOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :status, foreign_key: true, after: :customer_id
  end
end
