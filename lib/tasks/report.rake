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

      GROUP   BY c.id, c.first_name, cat.id, cat.name
      ;
SQL

    ActiveRecord::Base.connection.execute(sql).each do |row|
      puts row.join("\t")
    end
  end

end
