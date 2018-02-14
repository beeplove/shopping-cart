require 'csv'

namespace :report do
  desc "display count purchased by category"
  task by_category: :environment do
    sql = <<SQL
      SELECT
              c.id,
              c.first_name,
              cat.id,
              cat.name,
              sum(li.quantity)

      FROM    customers c

      JOIN    orders o ON c.id=o.customer_id
      JOIN    lineitems li ON li.order_id=o.id
      JOIN    skus s ON li.sku_id=s.id
      JOIN    products p ON s.product_id=p.id
      JOIN    product_categories pc ON pc.product_id=p.id
      JOIN    categories cat ON pc.category_id=cat.id

      GROUP BY
              c.id, c.first_name, cat.id, cat.name
      ;
SQL

    ActiveRecord::Base.connection.execute(sql).each do |row|
      puts row.join("\t")
    end
  end


  desc "generate csv file for product sold report"
  task generate_csv_product_sold: :environment do
    include ReportConcern

    filename = APP_CONFIG["report"]["path"] + "/product_sold_" + Time.current.strftime("%Y%m%d%H%M%S") + ".csv"
    data = get_product_sold_data(ENV['START_DATE'], ENV['END_DATE'], ENV['STEP'])

    CSV.open(filename, "wb") do |csv|
      data.each do |row|
        line = [row[:sku_id], row[:period], row[:total]]
        csv << line
        puts line.join("\t")
      end
    end
    puts "\nLocation of report generated: #{filename}"
  end

end
