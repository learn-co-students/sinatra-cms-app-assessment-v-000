class RequestsController < ApplicationController

  get '/requests/new' do
    erb :'/requests/create_request'
  end

  post '/request' do
    @request = User.create(username: params[:username], email: params[:email], password: params[:password])

    redirect to("/users/#{@user.slug}")
  end
