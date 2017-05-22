# frozen_string_literal: true

require 'telegram/bot'
require 'byebug'
require 'firebase'
require 'sidekiq'
require 'date'
require 'yaml'
require 'erb'

require_relative 'actions'
Dir['application/actions/*.rb'].each { |file| require file }

require_relative 'models'
Dir['application/models/*.rb'].each { |file| require file }

require_relative 'config/config'
require_relative 'bot'

Sidekiq.configure_server do |config|
  config.redis = { namespace: 'spaced_repetition_tb' }
end

module Application
  def self.run
    bot = Bot.new
    bot.run
  end
end
