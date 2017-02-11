class ResultSaver
  module Adapter
    module Postgres
      def self.save(sum)
        results = DB[:results]
        results.insert(
          result: sum
        )
      end
    end

    module Redis
      def self.save(sum)
        DB.rpush 'results', sum
      end
    end
  end

  def self.save(sum)
    self.adapter.save(sum)
  end

  def self.adapter
    ResultSaver::Adapter.const_get(Memory.database)
  end
end
