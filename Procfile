worker:    bundle exec ruby ./main.rb
sidekiq: bundle exec sidekiq -r ./preload.rb -C config/sidekiq.yml -L ./log/sidekiq.log
sidekiq_log: tail -f ./log/sidekiq.log
