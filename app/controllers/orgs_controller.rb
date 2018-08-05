class OrgsController < ApplicationController

  get '/orgs' do
    erb :"orgs/index"
  end

end
