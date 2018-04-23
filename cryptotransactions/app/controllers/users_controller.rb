class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    get '/login' do
        erb :'users/login'
    end

    post '/signup' do
        if logged_in?
            redirect '/transactions'
        else
            User.create(username: params[:username], email:params[:email], password_digest: params[:password])
            session[:username] = params[:username]
            redirect :'/transactions'
        end
    end

end