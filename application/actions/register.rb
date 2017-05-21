# frozen_string_literal: true

module Application
  module Actions
    class Register < Base
      def call
        user_model = Models::User.new

        user = user_model.find(message.from.id)
        if user
          bot.api.send_message(chat_id: message.chat.id, text: 'Ты зарегистрирован уже!')
        else
          user_model.create user_params
        end
      end

      private

      def user_params
        {
          "#{message.from.id}" => {
            name: "#{message.from.first_name} #{message.from.last_name}",
            telegram: {
              username: "#{message.from.username}"
            },
            items_count: 0
          }
        }
      end
    end
  end
end
