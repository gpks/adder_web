class ResultFetcher
  module Adapter
    module Postgres
      def self.fetch
        DB[:results].reverse_order(:id).limit(5).select_map(:result)
      end
    end

    module Redis
      def self.fetch
        DB.lrange('results', -5, -1)
      end
    end
  end

  def self.fetch
    self.adapter.fetch
  end

  def self.adapter
    ResultFetcher::Adapter.const_get(Memory.database)
  end
end
