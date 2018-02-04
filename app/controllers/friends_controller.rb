class FriendsController < ApplicationController
  post '/friend' do
    if logged_in?
      @friend=Friend.create(user_id: session[:user_id], friend_id: params["friend_id"])
      erb :'friends/show'
    else
       redirect to '/login'
    end
  end


end
