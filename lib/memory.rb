class Memory
  DATABASES = { pg: "postgres" }.freeze
  class << self
    def set
      return Sequel.connect(ENV["DATABASE_URL"]) if postgres?
      Redis.new
    end

    def postgres?
      ENV["DATABASE"] == DATABASES.fetch(:pg)
    end
  end
end
