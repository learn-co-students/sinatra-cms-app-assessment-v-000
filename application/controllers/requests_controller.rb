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
    @req = Request.create(content: params[:content], user_id: current_user.id)

    redirect to("/requests/#{@req.id}")
  end

  get '/requests/all' do
    if logged_in?
      erb :'/requests/requests'
    else
      redirect to("/login")
    end
  end

  get '/requests' do
    @requests = current_user.requests

    if logged_in?
      if @requests
        erb :'/requests/show_requests_by_user'
      else
        redirect to("/requests/all")
      end
    else
      redirect to("/login")
    end
  end

  get '/requests/:id' do
    if logged_in?
      @req = Request.find(params["id"])
      @user = User.find_by(id: env['rack.session'][:user_id])
      erb :'/requests/show_request'
    else
      redirect to("/login")
    end
  end

  get '/requests/:id/edit' do

    if logged_in?
      @req = Request.find(params[:id])
      @user = User.find_by(id: env['rack.session'][:user_id])
      if @req && @req.user_id == @user.id
        erb :'/requests/edit_request'
      else
        redirect to("/profile")
      end
    else
    redirect to("/login")
    end
  end

  patch '/requests/:id' do
    @req = Request.find(params[:id])
    @user = User.find_by(id: env['rack.session'][:user_id])

    if !params[:content].empty? && @req.user_id == @user.id
      @req.content = params[:content]
      @req.save
      redirect to("/requests/#{@req.id}")
    elsif params[:content].empty? && @req.user_id == @user.id
      redirect to("/requests/#{@req.id}/edit")
    elsif !params[:content].empty? && @req.user_id != @user.id
      redirect to("/profile")
    else
      redirect to("/login")
    end
  end

  delete '/requests/:id/delete' do
    @req = Request.find(params[:id])
    @user = User.find_by(id: env['rack.session'][:user_id])

    if logged_in? && @req.user_id == @user.id
      @req.destroy

      erb :'/requests/delete_confirmation'
    else
      redirect to("/login")
    end
  end

end
