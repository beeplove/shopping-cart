module ReportConcern
  extend ActiveSupport::Concern

  def get_product_sold_data start_date=nil, end_date=nil, step=nil
    start_date = (start_date || '2018-01-01').to_datetime
    end_date = (end_date || '2018-12-31').to_datetime
    step = (step || 'week').upcase

    Lineitem.where("created_at >= ? AND created_at <= ?", start_date, end_date)
      .select("sku_id, #{step}(created_at) as period, SUM(quantity) as total")
      .group('sku_id, period')
  end

end
