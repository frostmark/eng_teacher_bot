# frozen_string_literal: true

module Application
  class Actions::AddItem < Actions::Base
    def call
      item_model = Models::Item.new

    end

    private

    def item_params
      {
        question: "#{}",
        answer: "#{}",
        repeat_at: "#{}",
        repeat_count: "#{}"
      }
    end
  end
end
