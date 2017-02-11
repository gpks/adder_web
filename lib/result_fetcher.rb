class ResultFetcher
  def self.fetch
    self.adapter.fetch
  end

  def self.adapter
    Adapter.const_get(Memory.database)
  end
end
