module RedisDb
  class ResultSaver
    def self.save(sum)
      DB.rpush 'results', sum
    end
  end
end
