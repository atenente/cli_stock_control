class ArrayHandler
  def save
    self.class.class_variable_get('@@database') << self
  end
end