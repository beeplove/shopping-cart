class CreateLineitems < ActiveRecord::Migration[5.1]
  def change
    create_table :lineitems do |t|
      t.references :order
      t.references :sku
      t.integer :quantity, null: false
      t.integer :price_in_cents, null: false
      t.timestamps
    end
  end
end
