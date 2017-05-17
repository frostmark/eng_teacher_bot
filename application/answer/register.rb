module Application
  module Answer
    class Register
      attr_reader :db, :message, :bot

      def initialize(app)
        @db = app.db
        @message = app.message
        @bot = app.bot
      end

      def call
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
      end
    end
  end
end
