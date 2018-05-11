class UsersController < ApplicationController

  get '/users/:id' do
    erb :'users/show'
  end

end
