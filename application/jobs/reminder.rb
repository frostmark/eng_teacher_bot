# frozen_string_literal: true

module Application
  class Jobs::Reminder < Jobs::Base
    include Sidekiq::Worker

    def perform(how_hard = 'super hard', how_long = 1)
      logger.info 'perfroming...'
      sleep how_long
      logger.info "Workin' #{how_hard}"
    end
  end
end
