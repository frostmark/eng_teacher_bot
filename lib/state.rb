#frozen_string_literal: true

class State
  attr_reader :state, :user_id

  ALLOWED_STATES = ['/home', '/add']

  @@states = {}

  def initialize(user_id, default_state)
    @@states[user_id] = self
    @state = default_state
    @user_id = user_id
  end

  def change_state(state)
    @state = state if ALLOWED_STATES.include? state
  end

  def self.user_init?(user_id)
    @@states.key? user_id
  end

  def self.find(user_id)
    @@states[user_id] if @@states.key? user_id
  end
end
