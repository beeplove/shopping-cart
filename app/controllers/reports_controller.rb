class ReportsController < ApplicationController
  include ReportConcern

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

  #
  # TODO:
  #   - Take status into account
  #   - validate params
  #
  def product_sold
    jsonator get_product_sold_data(params[:start_date], params[:end_date], params[:step])
  end
end
