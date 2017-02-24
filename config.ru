require 'dashing'

configure do
  set :auth_token, 'AUTH_TOKEN'
  set :default_dashboard, 'main'
end

map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

run Sinatra::Application
