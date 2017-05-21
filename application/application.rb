require 'telegram/bot'
require 'byebug'
require 'firebase'
require 'date'
require 'yaml'
require 'erb'

require_relative 'answers'
Dir['application/answers/*.rb'].each { |file| require file }

require_relative 'config/config'
require_relative 'bot'

module Application
  def self.run
    bot = Bot.new
    bot.run
  end
end
