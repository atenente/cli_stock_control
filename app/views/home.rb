require_relative '../models/product_model'
require_relative '../views/product_view'
require_relative '../controllers/product_controller'

class App
  def initialize
    @controller = ProductController.new
  end

  def start
    loop do
      App.display_message("Menu de opções:".center(50, '*'))
      puts "1. Criar Product"
      puts "2. Ver Products"
      puts "3. Atualizar Product"
      puts "4. Deletar Product"
      puts "5. Sair"
      print "Digite o numero da opção > "
      choice = gets.to_i

      case choice
      when 1
        @controller.create
      when 2
        @controller.read
      when 3
        @controller.update
      when 4
        @controller.delete
      when 5
        puts "Saindo..."
        break
      else
        puts "Opção não encontrada"
      end
    end
  end

  def self.display_message(message)
    puts "\n"
    puts message
  end
end

# Executa o aplicativo
App.new.start
