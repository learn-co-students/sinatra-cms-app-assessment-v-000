class RecommendationsController < ApplicationController

  get '/recommendations/new' do
    erb :'/users/create_recommendation'
  end

  post '/recommendations' do
    @recommendation = Recommendation.create(content: params[:content], user_id: @user.id)

    redirect to("/recommendations/#{@recommendation.id}")
  end

  get '/recommendations/:id' do
    @recommendation = Recommendation.find(params["id"])

    if logged_in?
      @user = User.find_by(id: session[:user_id])
      erb :'/recommendations/show_recommendation'
    else
      redirect to("/login")
    end
  end

  get '/recommendations/:id/edit' do

    if logged_in?
      @recommendation = Recommendation.find(params[:id])
      @user = User.find_by(id: session[:user_id])
      if @recommendation && @recommendation.user_id == @user.id
        erb :'/recommendations/edit_recommendation'
      else
        redirect to("/profile")
      end
    else
    redirect to("/login")
    end
  end

  patch '/recommendation/:id' do
    @recommendation = Recommendation.find(params[:id])
    @user = User.find_by(id: session[:user_id])

    if !params[:content].empty? && @recommendation.user_id == @user.id
      @recommendation.content = params[:content]
      @recommendation.save
    elsif params[:content].empty? && @recommendation.user_id == @user.id
      redirect to("/recommendations/#{@recommendation.id}/edit")
    elsif !params[:content].empty? && @recommendation.user_id != @user.id
      redirect to("/profile")
    else
      redirect to("/login")
    end
  end

  delete '/recommendations/:id/delete' do
    @recommendation = Recommendation.find(params[:id])
    @user = User.find_by(id: session[:user_id])

    if logged_in? && @recommendation.user_id == @user.id
      @recommendation.destroy

      redirect to("/delete_confirmation")
    else
      redirect to("/login")
    end
  end

end
