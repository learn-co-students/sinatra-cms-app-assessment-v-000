class GamesController < ApplicationController

  get '/games' do
    if logged_in?
      @games = Game.all
      erb :'games/games'
    else
      redirect '/login'
    end
  end

  get '/games/new' do
    if logged_in?
      erb :'/games/create_game'
    else
      redirect '/login'
    end
  end

  post '/games' do
    if params[:title] == ""
      redirect '/games/new'
    else
      @game = current_user.games.create(title: params[:title])
      redirect "games/#{@game.id}"
    end
  end

  get '/games/:id' do
    if logged_in?
      @game = Game.find_by_id(params[:id])
      erb :'/games/show'
    else
      redirect '/login'
    end
  end

  get '/games/:id/edit' do
    if logged_in?
      @game = Game.find_by_id(params[:id])
       if @game.user_id == current_user.id
         erb :'/games/edit'
       else
         redirect '/games'
       end
    else
      redirect '/login'
    end
  end

  patch '/games/:id' do
    if parmas[:title] == ""
      redirect "/games/#{params[:id]}/edit"
    else
      @game = Game.find_by_id(params[:id])
      @game.title = params[:title]
      @game.save
      redirect "/games/#{@game.id}"
    end
  end

  delete '/games/:id/delete' do
    if logged_in?
      @game = Game.find_by_id(params[:id])
      if @game.user_id == current_user.id
        @game.delete
        redirect '/games'
      else
        redirect '/games'
      end
    else
      redirect '/login'
    end
  end
end
