require './config/environment'

class ReviewsController < Sinatra::Base

  set :public_folder, 'public'
  set :views, 'app/views'
  set :session_secret, "secret"
  enable :sessions
  use Rack::Flash

  get '/reviews' do

  end
end
