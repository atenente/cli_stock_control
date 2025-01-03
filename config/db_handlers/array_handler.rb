class ArrayHandler
  #def save
    #self.class.class_variable_get('@@database') << self
  #end

  FILE_PATH = "./app/models/database.txt"

  def self.all
    return [] unless File.exist?(FILE_PATH)
    File.readlines(FILE_PATH).map do |row|
      hash = row.chomp.split(',')
      { id: hash[0], desc: hash[1], price: hash[2], stock: hash[3] }
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
    File.open(FILE_PATH, "w") do |txt|
      products.each do |product|
        next if product[:id].to_i == id
        txt << product.values.join(',') + "\n"
      end
    end
    true
  end

  def self.find_data(id)
    return [] unless File.exist?(FILE_PATH)
    File.readlines(FILE_PATH).map do |row|
      hash = row.chomp.split(',')
      return { id: hash[0], desc: hash[1], price: hash[2], stock: hash[3] } if hash[0].to_i == id
    end
    false
  end

  def save
    File.open(FILE_PATH, "a") do |txt|
      txt << "#{id}, #{desc}, #{price}, #{stock}\n"
    end
  end
end
