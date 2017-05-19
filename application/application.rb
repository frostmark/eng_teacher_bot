require 'telegram/bot'
require 'byebug'
require 'couchrest'
require 'date'
require 'yaml'
require 'erb'

Dir['application/answers/*.rb'].each { |file| require file }

require_relative 'config/config'
require_relative 'bot'

module Application
  def self.run
    bot = Bot.new
    bot.run
  end
end
