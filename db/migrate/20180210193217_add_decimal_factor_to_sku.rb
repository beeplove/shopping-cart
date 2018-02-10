class AddDecimalFactorToSku < ActiveRecord::Migration[5.1]
  def up
    remove_column :skus, :fraction_allowed
    add_column :skus, :decimal_factor, :integer, null: false, default: 0, after: :price_in_cents
    rename_column :skus, :price_in_cents, :unit_price_in_cents
  end

  def down
    rename_column :skus, :unit_price_in_cents, :price_in_cents
    remove_column :skus, :decimal_factor
    add_column :skus, :fraction_allowed, :boolean, null: false, default: false, after: :price_in_cents
  end
end
