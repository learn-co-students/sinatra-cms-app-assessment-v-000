class SleeplogsController < ApplicationController
  get '/sleeplogs' do
    if Helper.is_logged_in?(session)
      @user = User.find_by_id(session[:user_id])
      @logs = @user.sleeplogs
      @logs = @logs.order(date: :desc)
      erb :'sleeplogs/index'
    else
      flash[:message] = 'You must be logged in to view this page'
      redirect to '/'
    end
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
    @log = Sleeplog.find_by_id(params[:id])
    if @log.user_id == session[:user_id]
      erb :'sleeplogs/edit'
    elsif Helper.is_logged_in?(session) && @log.user_id != session[:user_id]
      redirect to '/sleeplogs'
    else
      flash[:message] = "You must be logged in to edit a log."
      redirect to '/'
    end
  end

  get '/sleeplogs/:id/delete' do
    if Helper.current_user(session) == User.find_by_id(params[:id])
      Sleeplog.find_by_id(params[:id]).delete
      redirect to '/sleeplogs'
    else
      flash[:message] = "You must be logged in to delete a log."
      redirect to '/'
    end
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

  post '/sleeplogs/:id/edit' do
    @log = Sleeplog.find_by_id(params[:id])
    if params[:hours] != "" && params[:kind] != nil && params[:date] != "" && Helper.current_user(session).id == @log.user_id
      @log.update(hours: params[:hours], kind: params[:kind], date: params[:date])
      flash[:message] = "Your changes have been made"
      redirect to "/sleeplogs"
    elsif Helper.current_user(session).id != @log.user_id
      flash[:message] = "You must be the owner of this log."
      redirect to "/users/#{@log.user_id}"
    else
      flash[:message] = "You must fill in all fields."
      redirect to '/sleeplogs/new'
    end
  end
end
