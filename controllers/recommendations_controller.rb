class RecommendationsController < ApplicationController

  get '/recommendations/new' do
    erb :'/users/create_recommendation'
  end

  post '/recommendations' do
    @recommendation = Recommendation.create(recommendation: params[:recommendation], user_id: params[:user_id])

    redirect to("/recommendations/#{@recommendation.slug}")
  end

end
