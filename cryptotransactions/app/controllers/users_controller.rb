class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    get '/login' do
        erb :'users/login'
    end

    get 'logout' do
        session.clear
        erb :'/login'
    end

    post '/signup' do
        if logged_in?
            redirect '/transactions'
        else
            User.create(params)
            session[:username] = params[:username]
            redirect :'/transactions'
        end
    end

    post '/login' do
        if logged_in?
            redirect '/transactions'
        else
            User.find_by(username: params[:username])
            session[:username] = params[:username]
            redirect :'/transactions'
        end
    end

end