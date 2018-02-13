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

  #
  # TODO:
  #   - use params to form actual query
  #   - Take status into account
  #   - move reusable query to concern
  #
  def product_sold
    start_date = params[:start_date] || '2018-01-01'
    end_date = params[:end_date] || '2018-12-31'
    timespan = (params[:timespan] || 'week').upcase

    report = Lineitem.where("created_at >= ? AND created_at <= ?", "2018-02-11 00:00:00", "2018-02-13 23:59:59")
      .select("sku_id, #{timespan}(created_at) as period, SUM(quantity) as total")
      .group('sku_id, period')

    jsonator report
  end
end
