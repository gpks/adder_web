class ParamsParser
  def self.parse(params)
    raise ParamsError if params.nil?
    final = split_string(params)
    change_into_integers(final)
  end

  def self.split_string(string)
    string.split(',')
  end

  def self.change_into_integers(array)
    array.map(&:to_i)
  end
end
