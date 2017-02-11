module Adapter
  module Postgres
    def self.fetch
      DB[:results].reverse_order(:id).limit(5).select_map(:result)
    end

    def self.save(sum)
      results = DB[:results]
      results.insert(
        result: sum
      )
    end

    def self.set
      Sequel.connect(ENV["DATABASE_URL"])
    end
  end
end
