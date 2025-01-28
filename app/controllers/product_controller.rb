class ProductController
  def initialize
    @view_product = ProductView
  end

  def create
    desc, price, stock = @view_product.ask_update
    product = Product.new(desc, price, stock)
    if product.save
      App.display_message("Product creado!")
    end
  end

  def read
    products = Product.all
    if products.empty?
      App.display_message("Nenhum product encontrado".center(50, '*'))
    else
      @view_product.show_all(products)
    end
  end

  def update
    id = @view_product.ask_id
    desc, price, stock = @view_product.ask_update
    if Product.update(id: id, desc: desc, price: price, stock: stock)
      App.display_message("Product alterado")
    else
      App.display_message("Nenhum product encontrado".center(50, '*'))
    end
  end

  def delete
    id = @view_product.ask_id
    if Product.delete(id)
      App.display_message("Product deletado.")
    else
      App.display_message("Product não encontrado")
    end
  end
end
