
class UsersController < ApplicationController
 

    get "/" do
        if logged_in?
            redirect "/users/#{current_user.slug}"
        else
            erb :index
        end
    end

    get '/signup' do
        if logged_in?
            @user = current_user
            redirect "/users/#{@user.slug}"
        else
            erb :'users/signup'
        end
    end

    get '/login' do
        if logged_in?
            @user = current_user
            redirect "/users/#{@user.slug}"
        else
            erb :'users/login'
        end
    end


    get '/users/:user_slug' do
        @user = current_user
        erb :'/users/show'
    end

    post '/signup' do
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            redirect '/signup'
        else
            @user = User.create(params)
            session[:username] = params[:username]
            redirect "/users/#{@user.slug}"
        end
    end

    post '/login' do
        if params[:username] == "" || params[:password] == ""
            redirect '/login'
        else
            @user = User.find_by(username: params[:username])
            if @user && @user.password_digest == params[:password] 
                session[:username] = params[:username]
                redirect "/users/#{@user.slug}"
            else
                redirect 'login'
            end
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect '/'
        else
            redirect "/login"
        end
    end

end