require 'bundler'

Bundler.setup

Bundler.require(:default, ENV["RACK_ENV"].to_sym)
Dir["./app/controllers/**/*.rb"].each { |f| require f }

disable :run
run Rack::URLMap.new({ "/" => Example::Web })

use Rack::ShowExceptions
use Rack::ContentLength
use Rack::Static, :urls => [ '/favicon.ico', '/stylesheets' ], :root => "public"
