module Adapter
  module Redis
    def self.fetch
      DB.lrange('results', -5, -1)
    end

    def self.save(sum)
      DB.rpush 'results', sum
    end

    def self.set
      Redis.new
    end
  end
end
