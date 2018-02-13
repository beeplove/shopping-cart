class AddUniqueConstraintToProductCategories < ActiveRecord::Migration[5.1]
  def up
    if index_exists?(:product_categories, [:product_id, :category_id])
      remove_index :product_categories, [:product_id, :category_id], unique: true
    end
    add_index :product_categories, [:product_id, :category_id], unique: true
  end

  def down
    if index_exists?(:product_categories, [:product_id, :category_id])
      remove_index :product_categories, [:product_id, :category_id]
    end
  end
end
