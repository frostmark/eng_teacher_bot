# frozen_string_literal: true

module Application
  module Models
    class Base
      def db
        @db ||= Firebase::Client.new(Config::DB_URI)
      end
    end
  end
end
