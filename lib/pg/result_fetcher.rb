module Pg
  class ResultFetcher
    def self.fetch
      DB[:results].reverse_order(:id).limit(5).select_map(:result)
    end
  end
end
