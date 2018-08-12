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

  get '/orgs/:id/show' do
    @org = Organization.find(params[:id])
    erb :"orgs/show"
  end

  get '/orgs/:id/edit' do
    @org = Organization.find(params[:id])
    erb :"orgs/edit"
  end

  post '/orgs/new' do
    @org = Organization.create(params)
    @org.user_id = current_user.id
    @org.save
    redirect '/account'
  end

  post '/orgs/:id/edit' do
    @org = Organization.find(params[:id])
    if @org && @org.user == current_user
      params.each do |k,v|
        if !(v == "")
          binding.pry
          #@org.k = v
        end
      end
    end
    binding.pry
    redirect '/account'
  end

end
