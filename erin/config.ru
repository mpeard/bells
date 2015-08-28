require 'sidekiq'
require 'sidekiq/web'

use Rack::Session::Cookie, :secret => "some unique secret string here"
run Sidekiq::Web
