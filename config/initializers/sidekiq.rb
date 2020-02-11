require 'sidekiq'
require 'sidekiq/web'


#Sidekiq.configure_server do |config|
#  config.redis = { url: "#{ENV['REDIS_URL']}" }
#end


#Sidekiq.configure_client do |config|
#  config.redis = { url: "#{ENV['REDIS_URL']}" }
#end

if Rails.env.development?
  Sidekiq.configure_server do |config|
    config.redis = { url: 'redis://localhost:6379/0'}
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: 'redis://localhost:6379/0'}
  end
elsif Rails.env.staging?
  Sidekiq.configure_server do |config|
    config.redis = { url: "#{ENV['REDIS_URL']}"}
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: "#{ENV['REDIS_URL']}" }
  end
end
