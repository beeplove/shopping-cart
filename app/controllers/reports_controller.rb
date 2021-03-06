class ReportsController < ApplicationController
  include ReportConcern

  def by_category
    jsonator get_category_report_data
  end

  #
  # TODO:
  #   - Consider Lineitem#status when generating report
  #   - validate params
  #     - start_date < end_date
  #     - step any of day, week, month
  #
  def product_sold
    jsonator get_product_sold_data(params[:start_date], params[:end_date], params[:step])
  end
end
