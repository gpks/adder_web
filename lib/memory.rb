class Memory
  module Adapter
    module Postgres
      def self.set
        Sequel.connect(ENV["DATABASE_URL"])
      end
    end

    module Redis
      def self.set
        Redis.new
      end
    end
  end

  def self.set
    self.adapter.set
  end

  def self.adapter
    Memory::Adapter.const_get(database)
  end

  def self.database
    ENV["DATABASE"]
  end
end
