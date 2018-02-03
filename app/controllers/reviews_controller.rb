class ReviewsController < ApplicationController

  get '/reviews' do
    @musician = current_user
    @reviews = Review.all
    erb :'reviews/index'
  end

  # only allow musician to create their own reviews if they are logged in and session ids match current_user id
  get '/reviews/create' do
    if logged_in?
      @musician = current_user
      @venues = Venue.all
      erb :'reviews/new'
    else
      redirect to "/login"
    end
  end

  post '/reviews' do
    @musician = current_user
    @review = Review.create(content: params[:review][:content])
    @musician.reviews << @review
    @musician.save

    # check for empty location
    if params[:venue][:name] != "" && params[:venue][:location] != ""
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
    if logged_in?
      if @review.musician_id == current_user.id
        @review = Review.find_by(id: params[:id])
        erb :'reviews/edit'
      else
        redirect to "/musicians/#{current_user.slug}"
      end
    else
      redirect to "/login"
    end
  end

  patch '/reviews/:id' do
    @review = Review.find_by(id: params[:id])
    if params[:content] != "" && current_user == @review.musician_id
      @review.update(content: params[:content])
      redirect to "/reviews/#{@review.id}"
    end
  end

  get '/reviews/:id' do
    @review = Review.find_by(id: params[:id])
    if logged_in?
      @musician = current_user
    end
    erb :'reviews/show'
  end

  delete '/reviews/:id/delete' do
    @review = Review.find_by(id: params[:id])
    if logged_in?
      @musician = current_user
      if @musician.reviews.include?(@review)
        @review.delete
        redirect to "/musicians/#{current_user.slug}"
      else
        redirect to "/reviews/#{@review.id}"
      end
    else
      redirect to "/login"
    end
  end
end
