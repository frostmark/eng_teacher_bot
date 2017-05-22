# frozen_string_literal: true

module Application
  class Actions::Register < Actions::Base
    def call
      user_model = Models::User.new

      user = user_model.find(message.from.id).body
      if user
        bot.api.send_message(chat_id: message.chat.id, text: 'Ты зарегистрирован уже!')
      else
        user_model.create(message.from.id, user_params)
      end
    end

    private

    def user_params
      {
        name: "#{message.from.first_name} #{message.from.last_name}",
        telegram: {
          username: message.from.username.to_s
        }
      }
    end
  end
end
