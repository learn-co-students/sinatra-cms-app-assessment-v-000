class ReviewsController < Sinatra::Base

  set :public_folder, 'public'
  set :views, 'app/views'
  set :session_secret, "secret"
  enable :sessions

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
    @musician.reviews << @review
    @musician.save

    if params[:venue][:name] != ""
      @venue = Venue.create(name: params[:venue][:name], location: params[:venue][:location])
    else
      @venue = Venue.find_by(name: params[:existing_venue][:name])
    end

    @venue.reviews << @review
    @venue.save

    redirect to "/musicians/#{@musician.slug}"
  end

  get '/reviews/:id/edit' do
    @review = Review.find_by(id: params[:id])
    if session[:id]
      @musician = Musician.find_by(id: session[:id])
      if @review.musician_id = @musician.id
        @review = Review.find_by(id: params[:id])
        erb :'reviews/edit'
      else
        redirect to "/musicans/#{@musician.slug}"
      end
    else
      redirect to "/login"
    end
  end

  patch '/reviews/:id' do
    @review = Review.find_by(id: params[:id])
    @review.update(content: params[:content])
    redirect to "/reviews/#{@review.id}"
  end

  get '/reviews/:id' do
    @review = Review.find_by(id: params[:id])
    if session[:id]
      @musician = Musician.find_by(id: session[:id])
    end
    erb :'reviews/show'
  end

  delete '/reviews/:id/delete' do
    @review = Review.find_by(id: params[:id])
    if session[:id]
      @musician = Musician.find_by(id: session[:id])
      if @musician.reviews.include?(@review)
        @review.delete
        redirect to "/musicians/#{@musician.slug}"
      else
        redirect to "/reviews/#{@review.id}"
      end
    else
      redirect to "/login"
    end
  end
end
