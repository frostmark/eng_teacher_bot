module Application
  module Base
    def server
      @server ||= CouchRest.new
    end

    def db
      @db ||= server.database!(Config::DB_NAME)
    end
  end
end
