class PostgresHandler

  def self.table_name
    ApplicationHelper.pluralize(self.name.downcase)
  end

  def self.all
    Database.execute_sql(%{
      SELECT * FROM #{table_name}
    }).map do |data|
      #altera o hash para ficar no formato da view
      data.each_with_object({}) do |(key, value), itens|
        itens[key.to_sym] = value
      end
    end
  end

  def self.update(**attributes)
    return false if find_data(attributes[:id]).ntuples.zero?
    data_type = {
      String => ->(value) { "'#{value}'" },
      Numeric => ->(value) { value.to_i },
      Fixnum => ->(value) { value.to_i },
      Float => ->(value) { value.to_f }
    }
    data_set = []
    attributes.each do |key, value|
      next if key == :id
      data_set << "'#{key}' = #{data_type[value.class].call(value)}"
    end
    Database.execute_sql(%{
      UPDATE #{table_name}
      SET #{data_set.join(',')}
      WHERE id = #{attributes[:id]}
    })
  end

  def self.delete(id)
    return false if find_data(id).ntuples.zero?
    Database.execute_sql(%{
      DELETE FROM #{table_name} WHERE id = #{id}
    })
  end

  def self.find_data(id)
    Database.execute_sql(%{
      SELECT * FROM #{table_name} WHERE id = #{id}
    })
  end

  def save
    columns = []
    values = []
    self.instance_variables.each do |vari|
      next if vari.to_s.include?('id')
      columns << vari.to_s.delete('@')
      values << self.instance_variable_get(vari)
    end
    Database.execute_sql(%{
      INSERT INTO #{self.class.table_name}
      (#{columns.join(', ')})
      VALUES (#{values.join(', ')})
    })
  end

end
