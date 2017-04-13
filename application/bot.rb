module Application
  class Bot
    include Base

    def initialize

    end

    def run
      Telegram::Bot::Client.run(Config::BOT_TOKEN) do |bot|
        bot.listen do |message|
          case message.text
          when 'зарегестрируй меня'
            unless db.get(message.from.id.to_s)
              db.save_doc(
                          '_id' => message.from.id.to_s,
                          'name' => "#{message.from.first_name} #{message.from.last_name}",
                          'username' => message.from.username.to_s,
                          'words' => {}
                        )
            else
              bot.api.send_message(chat_id: message.chat.id, text: "Сорян, ты зарегестрирован уже!")
            end
          when /^Добавь:\s(.*\ -\ .*)/
            words = message.text.match(/\s(.*\ -\ .*)/)[1].split(' - ')

            doc = db.get(message.from.id.to_s)
            unless doc['words'][words[0]]
              doc['words'][words[0]] = {
                'translate' => words[1],
                'counter_repeat' => 0,
                'date_at' => DateTime.now.to_s
              }

              if doc.save
                bot.api.send_message(chat_id: message.chat.id, text: "#{words[0]} - #{words[1]} добавлено!")
              else
                bot.api.send_message(chat_id: message.chat.id, text: "Что-то пошло не так!")
              end
            else
              bot.api.send_message(chat_id: message.chat.id, text: "Такое слово уже есть!")
            end

            # bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
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
