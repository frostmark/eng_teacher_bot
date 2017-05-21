module Application
  module Actions
    class Base
      attr_reader :db, :message, :bot

      def initialize(app)
        @db = app.db
        @message = app.message
        @bot = app.bot
      end
    end
  end
end
