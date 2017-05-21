# frozen_string_literal: true

module Application
  module Actions
    class Base
      attr_reader :message, :bot

      def initialize(app)
        @message = app.message
        @bot = app.bot
      end
    end
  end
end
