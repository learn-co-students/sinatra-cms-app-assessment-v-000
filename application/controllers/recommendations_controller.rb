class RecommendationsController < ApplicationController

  get '/recommendations/new' do
    erb :'/users/create_recommendation'
  end

  post '/recommendations' do
    @recommendation = Recommendation.create(recommendation: params[:recommendation], user_id: params[:user_id])

    redirect to("/recommendations/#{@recommendation.slug}")
  end

  get '/tweets/:id' do
    @tweet = Tweet.find(params["id"])

    if logged_in?
      @user = User.find_by(id: session[:user_id])
      erb :'/tweets/show_tweet'
    else
      redirect to("/login")
    end
  end

  get '/tweets/:id/edit' do

    if logged_in?
      @tweet = Tweet.find(params[:id])
      @user = User.find_by(id: session[:user_id])
      if @tweet && @tweet.user_id == @user.id
        erb :'/tweets/edit_tweet'
      else
        redirect to("/tweets")
      end
    else
    redirect to("/login")
    end
  end

  patch '/tweets/:id' do
    @tweet = Tweet.find(params[:id])
    @user = User.find_by(id: session[:user_id])

    if !params[:content].empty? && @tweet.user_id == @user.id
      @tweet.content = params[:content]
      @tweet.save
    elsif params[:content].empty? && @tweet.user_id == @user.id
      redirect to("/tweets/#{@tweet.id}/edit")
    elsif !params[:content].empty? && @tweet.user_id != @user.id
      redirect to("/tweets")
    else
      redirect to("/login")
    end
  end

  delete '/tweets/:id/delete' do
    @tweet = Tweet.find(params[:id])
    @user = User.find_by(id: session[:user_id])

    if logged_in? && @tweet.user_id == @user.id
      @tweet.destroy

      redirect to("/tweets")
    else
      redirect to("/login")
    end
  end

end
