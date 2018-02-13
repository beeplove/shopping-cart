class ReportsController < ApplicationController
  def by_category
    # TODO: Add proper index to optimize this query
    jsonator Customer.joins(
      orders: [
        { lineitems: [
          { sku: [
            { product: [
              { product_categories: :category }
            ]}
          ]}
        ]}
      ]
    ).select('
      customers.id,
      customers.first_name,
      categories.id as category_id,
      categories.name as category_name,
      sum(lineitems.quantity) as total'
    ).group('customers.id, customers.first_name, categories.id, categories.name')
  end
end
