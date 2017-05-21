# frozen_string_literal: true

module Application
  class Models::Base
    def db
      @db ||= Firebase::Client.new(Config::DB_URI)
    end
  end
end
