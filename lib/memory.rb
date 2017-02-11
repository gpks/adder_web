class Memory
  def self.set
    self.adapter.set
  end

  def self.adapter
    Adapter.const_get(database)
  end

  def self.database
    ENV["DATABASE"]
  end
end
