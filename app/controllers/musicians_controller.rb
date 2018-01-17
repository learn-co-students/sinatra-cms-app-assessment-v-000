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
      @musician = Musician.new(username: params[:username], password: params[:password])

      if @musician.save
          redirect "/login"
      else
          redirect "/signup"
      end
    end
  end

  get '/login' do
    erb :'musicians/login'
  end


end
