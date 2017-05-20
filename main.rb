$LOAD_PATH.unshift File.expand_path('../', __FILE__)

require 'dotenv'
Dotenv.load

require_relative 'application/application'

Application.run
