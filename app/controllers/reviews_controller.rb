require './config/environment'

class ReviewsController < Sinatra::Base

  set :public_folder, 'public'
  set :views, 'app/views'
  set :session_secret, "secret"
  enable :sessions
  use Rack::Flash

  get '/reviews' do
    @reviews = Review.all
    erb :'reviews/index'
  end

  get '/reviews/create' do
    if session[:id]
      @venues = Venue.all
      erb :'reviews/new'
    else
      redirect to "/login"
    end
  end

  post '/reviews' do
    @musician = Musician.find_by(id: session[:id])

    @review = Review.create(content: params[:review][:content])
    @review.musician = @musician

    if params[:venue][:name] != ""
      @venue = Venue.create(name: params[:venue][:name], location: params[:venue][:location])
    else
      @venue = Venue.find_by(name: params[:existing_venue][:name])
    end

    @review.venue = @venue
    @review.save

    redirect to "/musicians/#{@musician.slug}"
  end

  get '/reviews/:id/edit' do
    binding.pry
    @musician = Musician.find_by(id: session[:id])
    @review = Review.find_by(id: params[:id])
    if @review.musician_id = @musican.id
      if session[:id] &&
        @review = Review.find_by(id: params[:id])
        erb :'reviews/edit'
      else
        redirect to "/login"
      end
    else
      redirect to "/musicans/#{@musician.slug}"
    end
  end

  patch '/reviews/:id' do

  end

  get '/reviews/:id' do

  end
end
