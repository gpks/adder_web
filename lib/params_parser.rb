class ParamsParser
  def self.parse(params)
    final = split_string(params["values"])
    change_into_integers(final)
  end

  def self.split_string(string)
    string.split(',')
  end

  def self.change_into_integers(array)
    array.map(&:to_i)
  end
end
