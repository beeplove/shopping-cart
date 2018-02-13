module ReportConcern
  extend ActiveSupport::Concern

  #
  # TODO
  #   - keeping the report very simple for now, consider joining with Sku and Product for more verbose report
  #
  def get_product_sold_data start_date=nil, end_date=nil, step=nil
    start_date  = (start_date || '2018-01-01').to_datetime
    end_date    = (end_date || '2018-12-31').to_datetime
    step        = (step || 'week').upcase

    Lineitem.where("created_at >= ? AND created_at <= ?", start_date, end_date)
      .select("sku_id, #{step}(created_at) as period, SUM(quantity) as total")
      .group('sku_id, period')
  end

  #
  # TODO: Add proper index to optimize this query
  #
  def get_category_report_data
    Customer.joins(
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
