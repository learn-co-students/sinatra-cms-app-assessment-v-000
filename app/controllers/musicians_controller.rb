require 'sinatra/base'
require 'sinatra/flash'

class MusiciansController < ApplicationController

  get '/signup' do
    erb :'musicians/create'
  end

  post '/signup' do
    if params[:username] != ""
      @musician = Musician.new(username: params[:username], password: params[:password])
    else
      flash[:notice] = "Please enter a Username"
      redirect to "/signup"
    end

    if @musician.save
      session[:id] = @musician.id
      redirect to "/musicians/#{@musician.slug}"
    else
      flash[:notice] = "Please Enter a Password"
      redirect to "/signup"
    end
  end

  get '/login' do
    erb :'musicians/login'
  end

  post '/login' do
    @musician = Musician.find_by(:username => params[:username])

    if @musician && @musician.authenticate(params[:password])
      session[:id] = @musician.id
      redirect to "/musicians/#{@musician.slug}"
    else
      flash[:notice] = "Please input a password"
      redirect to "/login"
    end
  end

  # only let musician see their own page
  get '/musicians/:slug' do
    if logged_in?
      @musician = Musician.find_by_slug(params[:slug])
      erb :'musicians/show'
    else
      redirect to "/login"
    end
  end

  get '/logout' do
    session.clear
    redirect to "/"
  end
end
