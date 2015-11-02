require 'haml'
require 'ostruct'

SiteConfig = OpenStruct.new(
  :title => 'Ping Page',
  :author => 'Rob Kinyon',
  :url_base => 'http://localhost:8080/',
)

module Example
  class Web < Sinatra::Base
    configure do
      set :public_folder, "#{File.dirname(__FILE__)}/../public"
      set :views, "#{File.dirname(__FILE__)}/../views"
      set :haml, { :attr_wrapper => '"' }
    end

    get "/" do
      redis_status = `/usr/bin/sudo /usr/sbin/service redis-server status`.chomp!
      nginx_status = `/usr/bin/sudo /usr/sbin/service nginx status`.chomp!
      passenger_status = `/usr/bin/sudo /usr/sbin/passenger-status`.chomp!
      haml :index, locals: {
        redis_status: redis_status,
        nginx_status: nginx_status,
        passenger_status: passenger_status,
      }
    end
  end
end

