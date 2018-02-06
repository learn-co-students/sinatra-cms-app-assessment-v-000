class ReviewsController < ApplicationController

  get '/reviews' do
    @reviews = Review.all
    erb :'reviews/index'
  end

  get '/reviews/create' do
    if logged_in?
      @venues = Venue.all
      erb :'reviews/new'
    else
      redirect to "/login"
    end
  end

  post '/reviews' do
    @review = Review.create(content: params[:review][:content])
    current_user.reviews << @review
    current_user.save

    if params[:venue][:name] != "" && params[:venue][:location] != ""
      @venue = Venue.create(name: params[:venue][:name], location: params[:venue][:location])
    else
      @venue = Venue.find_by(name: params[:existing_venue][:name])
    end

    @venue.reviews << @review
    @venue.save

    redirect to "/musicians/#{current_user.slug}"
  end

  get '/reviews/:id/edit' do
    if logged_in?
      @review = Review.find_by(id: params[:id])
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
    if params[:content] != "" && current_user == @review.musician
      @review.update(content: params[:content])
      redirect to "/reviews/#{@review.id}"
    end
  end

  get '/reviews/:id' do
    @review = Review.find_by(id: params[:id])
    erb :'reviews/show'
  end

  delete '/reviews/:id/delete' do
    if logged_in?
      @review = Review.find_by(id: params[:id])
      if current_user.reviews.include?(@review)
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
