class PostgresHandler

  def self.all
    Database.execute_sql(%{
      SELECT * FROM products
    }).map do |product|
      #altera o hash para ficar no formato da view
      product.each_with_object({}) do |(key, value), products|
        products[key.to_sym] = value
      end
    end
  end

  def self.create
    desc, price, stock = @view_product.ask_update
    product = Product.new(desc, price, stock)
    if product.save
      App.display_message("Product creado!")
    end
  end

  def self.update(id, desc, price, stock)
    return false if find_data(id).ntuples.zero?
    Database.execute_sql(%{
      UPDATE products
      SET
        "desc" = '#{desc}',
        price = #{price},
        stock = #{stock}
      WHERE
        id = #{id}
    })
  end

  def self.delete(id)
    return false if find_data(id).ntuples.zero?
    Database.execute_sql(%{
      DELETE FROM products WHERE id = #{id}
    })
  end

  def self.find_data(id)
    Database.execute_sql(%{
      SELECT * FROM products WHERE id = #{id}
    })
  end

  def save
    Database.execute_sql(%{
      INSERT INTO products ("desc", price, stock) VALUES ('#{desc}', #{price}, #{stock})
    })
  end

end
