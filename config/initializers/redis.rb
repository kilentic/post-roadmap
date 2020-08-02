uri = URI.parse ENV['REDIS_URI'] 
Redis.current = Redis.new uri: uri
#Redis.current = Redis.new(:host => '127.0.0.1', :port => 6379)
