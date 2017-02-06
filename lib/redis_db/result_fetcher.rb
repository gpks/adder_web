module RedisDb
  class ResultFetcher
    def self.fetch
      DB.lrange('results', -5, -1)
    end
  end
end
