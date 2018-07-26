require 'rack-flash'
require 'pry'
class RequestsController < ApplicationController

  use Rack::Flash

  get '/requests/new' do
    if logged_in?
      erb :'/requests/create_request'
    else
      redirect to("/login")
    end
  end

  post '/requests' do
    @request = Request.create(content: params[:content], user_id: current_user.id)

    redirect to("/requests/#{@request.id}")
  end

  get '/requests' do
    if logged_in?
      erb :'/requests/requests'
    else
      redirect to("/login")
    end
  end

  get '/requests/:slug' do
    @user = User.find_by_slug(params[:slug])

    if logged_in?
      if @user
        erb :'show_requests_by_user'
      else
        flash[:message] = "Make sure to spell your username correctly. Please try again."
        redirect to("/requests")
      end
    else
      redirect to("/login")
    end
  end

  get '/requests/:id' do
    if logged_in?
      @request = Request.find(params["id"])
      @user = User.find_by(id: env['rack.session'][:user_id])
      erb :'/requests/show_request'
    else
      redirect to("/login")
    end
  end

  get '/requests/:id/edit' do

    if logged_in?
      @request = Request.find(params[:id])
      @user = User.find_by(id: env['rack.session'][:user_id])
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
    @user = User.find_by(id: env['rack.session'][:user_id])

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
    @user = User.find_by(id: env['rack.session'][:user_id])

    if logged_in? && @request.user_id == @user.id
      @request.destroy

      redirect to("/delete_confirmation")
    else
      redirect to("/login")
    end
  end

end
