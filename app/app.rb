require_relative '../config/initializers'

class App
  def initialize
    @controller = ProductController.new
    @menu = Menu.new(@controller)
  end

  def start
    loop do
      App.display_message("Menu de opções:".center(50, '*'))
      @menu.options.each {|option| puts option.last[:desc]}
      print "Digite o numero da opção > "
      choice = gets.to_i
      @menu.options[choice][:action].call
    end
  end

  def self.display_message(message)
    puts "\n"
    puts message
  end
end

# Executa o aplicativo
App.new.start
