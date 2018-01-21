class VenuesController < Sinatra::Base

  set :public_folder, 'public'
  set :views, 'app/views'
  set :session_secret, "secret"
  enable :sessions

  get '/venues' do
    @venues = Venue.all
    @musician = Musician.find_by(id: session[:id])
    erb :'venues/index'
  end

end
