class ResultFetcher
  def self.fetch
    return Pg::ResultFetcher.fetch if Memory.postgres?
    RedisDb::ResultFetcher.fetch
  end
end
