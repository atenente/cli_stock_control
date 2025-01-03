require_relative '../config/db_handlers/csv_handler.rb'
require_relative '../config/db_handlers/array_handler.rb'
require_relative '../config/db_handlers/postgres_handler.rb'
require_relative '../app/models/active_model.rb'
require  'byebug'

ROOT_PATH = File.expand_path('..', __dir__)
Dir.glob("#{ROOT_PATH}/**/*.rb").each do |file|
  next if file == __FILE__
  next if file.include? 'app.rb'

  require file
end
