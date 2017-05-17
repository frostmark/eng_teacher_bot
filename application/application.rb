require 'telegram/bot'
require 'byebug'
require 'couchrest'
require 'date'
require 'yaml'
require 'erb'

require_relative 'config/config'
require_relative 'base'
require_relative 'bot'

module Application
  def self.run
    bot = Bot.new
    bot.run
  end
end
