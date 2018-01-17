class MusiciansController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/signup' do
    erb :'musicians/create'
  end

  post '/signup' do
    if !session[:id]
      @musician = Musician.create(username: params[:username], password_digest: params[:password])
    else
      redirect to "/reviews"
    end
  end

end
