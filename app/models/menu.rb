class Menu
  attr_reader :options

  def initialize(controller)
    @options = {
      1 => {desc: '1. Criar Product',     action: -> {controller.create}},
      2 => {desc: '2. Ver Products',      action: -> {controller.read}},
      3 => {desc: '3. Atualizar Product', action: -> {controller.update}},
      4 => {desc: '4. Deletar Product',   action: -> {controller.delete}}
    }
    @options.default = {desc: nil, action: -> { puts "Option Invalid"}}
    #hash.fetch(:c){puts 'invalid'} 
  end
end
