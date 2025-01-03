require 'pg'
require 'yaml'
require 'date'
require  'byebug'
class Database
  def self.execute_sql(sql)
    result = connection.exec(sql)
    connection.close
    result
  end

  def self.connection
    PG.connect(environment_db_params)
  rescue PG::Error => e
    raise e.message
  end

  def self.environment_db_params
    data = File.read('config/database.yml')
    db = YAML.load(data, aliases: true)
    db[ENV['DATABASE']] || db['development']
  end

  def self.drop_tables
    execute_sql(%{ DROP TABLE IF EXISTS products })
  end

  def self.create_tables
    execute_sql(%{
      CREATE TABLE IF NOT EXISTS products (
        id SERIAL PRIMARY KEY,
        "desc" VARCHAR(255) NOT NULL,
        price DECIMAL(30,6) NOT NULL,
        stock DECIMAL(30,6) NOT NULL
      )
    })
  end

end
