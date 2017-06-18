# frozen_string_literal: true

module Application
  class Models::User < Models::Base
    node :users

    attr_reader :state

    ALLOWED_STATES = ['/home', '/add']

    def self.allowed_states
      ALLOWED_STATES
    end

    def self.allowed_state?(state)
      ALLOWED_STATES.include? state
    end

    def change_state(state)
      @state = state if self.allowed_state?(state)
    end
  end
end
