class Product < ActiveModel
  attr_accessor :id, :desc, :price, :stock

  def initialize(desc, price, stock)
    @id = (Product.all.last[:id].to_i + 1) rescue 1
    @desc = desc
    @price = price
    @stock = stock
  end

end
