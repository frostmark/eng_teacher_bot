module Application
  module Config
    CONFIG_FILE = YAML.load_file('config/config.yml')

    BOT_TOKEN = CONFIG_FILE['bot_token']
    DB_NAME = CONFIG_FILE['database']['name']
  end
end
