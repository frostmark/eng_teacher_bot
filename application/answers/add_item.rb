module Application
  module Answers
    class AddItem < AnswerBase
      def call
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
      end
    end
  end
end
