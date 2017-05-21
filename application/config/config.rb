# frozen_string_literal: true

module Application
  module Config
    CONFIG_FILE = YAML.safe_load(ERB.new(File.read('config/config.yml')).result)

    BOT_TOKEN = CONFIG_FILE['bot_token']
    DB_URI = CONFIG_FILE['database']['uri']
    DB_SECRET_KEY = CONFIG_FILE['database']['secret_key']
  end
end
