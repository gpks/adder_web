module Pg
  class ResultSaver
    def self.save(sum)
      results = DB[:results]
        results.insert(
          result: sum
        )
    end
  end
end
