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

  get '/orgs/:id/delete' do
    if logged_in?
      @org = Organization.find(params[:id])
      if @org && @org.user == current_user
        @org.delete
      elsif @org && current_user.email == "fkmccallion@hotmail.com"
        @org.delete
      end
      redirect '/account'
    else
      redirect '/login'
    end
  end

  post '/orgs/new' do

    @org = Organization.create("name" => params[:name], "address" => params[:address], "phone" => params[:phone], "email" => params[:email], "website" => params[:website], "description" => params[:description])
    @org.user_id = current_user.id

    if !params["category"]["name"].empty?
      cat = Category.find_by(:name => params[:category][:name])
      if cat
        @org.category_id = cat.id
      else
        cat = Category.create("name" => params[:category][:name])
        @org.category_id = cat.id
      end
    end
    binding.pry
    @org.save

    redirect '/account'
  end

  post '/orgs/:id/edit' do
    @org = Organization.find(params[:id])
    if @org && @org.user == current_user
      params.each_pair do |k,v|
        if !(v.empty? || k == "id")
          case k
          when "name"
            @org.name = v
          when "address"
            @org.address = v
          when "phone"
            @org.phone = v
          when "email"
            @org.email = v
          when "website"
            @org.website = v
          when "description"
            @org.description = v
          end
        end
      end
    end
    @org.save

    redirect '/account'
  end

end
