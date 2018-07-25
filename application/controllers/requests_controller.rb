class RequestsController < ApplicationController

  get '/requests/new' do
    erb :'/requests/create_request'
  end

  post '/request' do
    @request = Request.create(content: params[:content], user_id: @user.id)

    redirect to("/requests/#{@request.slug}")
  end

  get '/requests/:id' do
    @request = Request.find(params["id"])

    if logged_in?
      @user = User.find_by(id: session[:user_id])
      erb :'/requests/show_request'
    else
      redirect to("/login")
    end
  end

  get '/requests/:id/edit' do

    if logged_in?
      @request = Request.find(params[:id])
      @user = User.find_by(id: session[:user_id])
      if @request && @request.user_id == @user.id
        erb :'/requests/edit_request'
      else
        redirect to("/profile")
      end
    else
    redirect to("/login")
    end
  end

  patch '/request/:id' do
    @request = Request.find(params[:id])
    @user = User.find_by(id: session[:user_id])

    if !params[:content].empty? && @request.user_id == @user.id
      @request.content = params[:content]
      @request.save
    elsif params[:content].empty? && @request.user_id == @user.id
      redirect to("/requests/#{@request.id}/edit")
    elsif !params[:content].empty? && @request.user_id != @user.id
      redirect to("/profile")
    else
      redirect to("/login")
    end
  end

  delete '/requests/:id/delete' do
    @request = Request.find(params[:id])
    @user = User.find_by(id: session[:user_id])

    if logged_in? && @request.user_id == @user.id
      @request.destroy

      redirect to("/delete_confirmation")
    else
      redirect to("/login")
    end
  end

end
