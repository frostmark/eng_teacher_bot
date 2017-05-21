# frozen_string_literal: true

module Application
  class Bot
    attr_reader :message, :bot

    def initialize
      @message = nil
      @bot = nil
    end

    def run
      Telegram::Bot::Client.run(Config::BOT_TOKEN) do |bot|
        @bot = bot
        bot.listen do |message|
          @message = message
          case message.text
          when 'зарегестрируй меня'
            Actions::Register.new(self).call
          when /^Добавь:\s(.*\ -\ .*)/
            Actions::AddItem.new(self).call
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
