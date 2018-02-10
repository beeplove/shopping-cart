class CreateSkus < ActiveRecord::Migration[5.1]
  def change
    create_table :skus do |t|
      t.references :product
      t.references :unit
      t.integer :price_in_cents, null: false
      t.boolean :fraction_allowed, null: false, default: false
      t.timestamps
    end
  end
end
