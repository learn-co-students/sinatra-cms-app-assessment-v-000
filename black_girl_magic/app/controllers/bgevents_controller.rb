class BGEventsController < ApplicationController

  get "/bgevents" do
    redirect_if_not_logged_in
    @bgevents = BGEvent.all
    erb :'bgevents/index'
  end

  get "/bgevents/new" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'bgevents/new'
  end

  get "/bgevents/:id/edit" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @bgevent = BGEvent.find(params[:id])
    erb :'/bgevents/edit'
  end

  post "/bgevents/:id" do
    @bgevent = BGEvent.create(name: params["bgevent"]["name"])
  end

end
