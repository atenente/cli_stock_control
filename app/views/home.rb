ROOT_PATH = File.expand_path('..', __dir__)
Dir.glob("#{ROOT_PATH}/**/*.rb").each do |file|
  next if file == __FILE__

  require file
end

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
