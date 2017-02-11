class ResultSaver
  def self.save(sum)
    self.adapter.save(sum)
  end

  def self.adapter
    Adapter.const_get(Memory.database)
  end
end
