module Application
  class Bot
    attr_reader :message, :bot

    def initialize
      @message = nil
      @db = db
      @bot = nil
    end

    def server
      @server ||= CouchRest.new
    end

    def db
      @db ||= server.database!(Config::DB_NAME)
    end

    def run
      Telegram::Bot::Client.run(Config::BOT_TOKEN) do |bot|
        @bot = bot
        bot.listen do |message|
          @message = message
          case message.text
          when 'зарегестрируй меня'
            Answers::Register.new(self).call
          when /^Добавь:\s(.*\ -\ .*)/
            Answers::AddItem.new(self).call
          when 'хэлп'
            help = <<~HELP
              hi
            HELP

            bot.api.send_message(chat_id: message.chat.id, text: help)
          when 'exit'
            # exit
          else
            bot.api.send_message(chat_id: message.chat.id, text: "#{message.from.first_name}, я тебя не понял.")
          end
        end
      end
    end
  end
end
