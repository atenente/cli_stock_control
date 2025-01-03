class ProductView
  def self.show_all(products)
    App.display_message("Lista de Todos Products".center(50, '*'))
    puts "ID\tDesc\tPrice\tStock"
    products.each do |product|
      puts "#{product[:id]}\t#{product[:desc]}\t#{product[:price]}\t#{product[:stock]}"
    end
  end

  def self.ask_update
    App.display_message("Crie o product".center(50, '*'))
    print "Digite desc: "
    desc = gets.chomp
    desc = "empty" if desc.empty?
    print "Digite price: "
    price = gets.to_f
    print "Digite stock: "
    stock = gets.to_i
    [desc, price, stock]
  end

  def self.ask_id
    print "Digite ID: "
    gets.to_i
  end

end
