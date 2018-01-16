class BGEventsController < ApplicationController
  #make sure to bundle install
  #make sure to rake db:migrate SINATRA_ENV=test
  get "/bgevents" do
    redirect_if_not_logged_in
    @events = Event.all
    erb :'bgevents/index'
  end

  get "/bgevents/new" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'bgevents/new'
  end
end
