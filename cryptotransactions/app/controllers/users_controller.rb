class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    get 'login' do
        erb :'users/login'
    end
end