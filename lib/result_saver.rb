class ResultSaver
  def self.save(sum)
    return Pg::ResultSaver.save(sum) if Memory.postgres?
    RedisDb::ResultSaver.save(sum)
  end
end
