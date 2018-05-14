class SleeplogsController < ApplicationController
  get '/sleeplogs' do
    @user = User.find_by_id(session[:user_id])
    @logs = @user.sleeplogs
    erb :'sleeplogs/index'
  end

  get '/sleeplogs/new' do
    if Helper.is_logged_in?(session)
      erb :'/sleeplogs/new'
    else
      flash[:message] = "You must be logged in to add a log."
      redirect to '/'
    end
  end

  get '/sleeplogs/:id/edit' do
    erb :'sleeplogs/edit'
  end

  get '/sleeplogs/:id/delete' do
    Sleeplog.find_by_id(params[:id]).delete
    redirect to '/sleeplogs'
  end

  post '/sleeplogs/new' do
    if params[:hours] != "" && params[:kind] != nil && params[:date] != ""
      @log = Sleeplog.create(params)
      @user = User.find_by_id(session[:user_id])
      @user.sleeplogs << @log
      redirect to "/sleeplogs"
    else
      flash[:message] = "You must fill in all fields."
      redirect to '/sleeplogs/new'
    end
  end
end
