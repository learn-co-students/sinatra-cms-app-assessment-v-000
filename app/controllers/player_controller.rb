require 'pry'
class PlayerController < ApplicationController
  
  get '/player/:username' do
    if is_logged_in?
      @player = Player.find_by(username: params[:username])
      erb :'/player/index'
    else
      erb :index
    end
  end

  post '/login' do
    @player = Player.find_by(username: params[:username])
    session[:id] = @player.id
    redirect "/player/#{@player.username}"
  end

  post '/signup' do
    @session = session
    @player = Player.create(params)
    @session[:id] = @player.id
    @player.save
    binding.pry
    redirect "/player/#{@player.username}"
  end
end