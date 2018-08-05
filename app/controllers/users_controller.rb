class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect "orgs/index"
    else
      erb :'users/signup'
    end
  end

end
