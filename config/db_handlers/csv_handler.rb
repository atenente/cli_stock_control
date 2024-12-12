require 'csv'

class CsvHandler
  FILE_PATH = "./app/models/database.csv"

  def self.all
    return [] unless File.exist?(FILE_PATH)
    CSV.read(FILE_PATH).map do |row|
      { id: row[0], desc: row[1], price: row[2], stock: row[3] }
    end
  end

  def self.update(id, desc, price, stock)
    return false unless delete(id)
    product = Product.new(desc, price, stock)
    product.id = id
    product.save
  end

  def self.delete(id)
    return false unless find_data(id)
    products = all
    CSV.open(FILE_PATH, "w") do |csv|
      products.each do |product|
        next if product[:id].to_i == id
        csv << product.values
      end
    end
    true
  end

  def self.find_data(id)
    return [] unless File.exist?(FILE_PATH)
    CSV.foreach(FILE_PATH) do |row|
      return { id: row[0], desc: row[1], price: row[2], stock: row[3] } if row[0].to_i == id
    end
    false
  end

  def save
    CSV.open(FILE_PATH, "a") do |csv|
      csv << [id, desc, price, stock]
    end
  end

end
