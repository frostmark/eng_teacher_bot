module Application
  module Config
    CONFIG_FILE = YAML.load(ERB.new(File.read('config/config.yml')).result)

    BOT_TOKEN = CONFIG_FILE['bot_token']
    DB_NAME = CONFIG_FILE['database']['name']
  end
end
