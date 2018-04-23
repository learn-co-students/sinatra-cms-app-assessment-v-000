class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    get '/login' do
        erb :'users/login'
    end


    get '/users/:user_slug' do
        @user = current_user
        binding.pry
        erb :'/users/show'
    end

    post '/signup' do
        if logged_in?
            redirect '/transactions'
        else
            @user = User.create(params)
            session[:username] = params[:username]
            redirect "/users/#{@user.slug}"
        end
    end

    post '/login' do
        if logged_in?
            redirect '/transactions'
        else
            @user = User.find_by(username: params[:username])
            session[:username] = params[:username]
            redirect "/users/#{@user.slug}"
        end
    end

    get 'logout' do
        if logged_in?
            session.clear
            redirect '/'
        else
            redirect "/users/#{@user.slug}"
        end
    end

end