class Product
  attr_accessor :id, :desc, :price, :stock

  @@products = []
  @@next_id = 1

  def initialize(desc, price, stock)
    @id = @@next_id
    @desc = desc
    @price = price
    @stock = stock
    @@next_id += 1
  end

  def self.all
    @@products
  end

  def self.find(id)
    @@products.find { |product| product.id == id }
  end

  def save
    @@products << self
  end

  def update(desc, price, stock)
    @desc = desc
    @price = price
    @stock = stock
  end

  def delete
    @@products.delete(self)
  end
end
