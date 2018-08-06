class OrgsController < ApplicationController

  get '/orgs' do
    erb :"orgs/index"
  end

  get '/orgs/new' do
    if logged_in?
      erb :"orgs/new"
    else
      redirect '/login'
    end
  end

  post '/orgs/new' do
    @org = Organization.create(params)
    @org.user_id = current_user.id
    redirect '/account'
  end

end
