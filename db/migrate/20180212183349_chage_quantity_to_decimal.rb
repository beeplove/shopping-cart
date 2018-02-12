class ChageQuantityToDecimal < ActiveRecord::Migration[5.1]
  def up
    change_column :lineitems, :quantity, :decimal, precision: 9, scale: 4, null: false
  end

  def down
    change_column :lineitems, :quantity, :integer, null: false
  end
end
