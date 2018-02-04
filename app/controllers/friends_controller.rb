class FriendsController < ApplicationController
  get '/friends' do
    erb :'friends/show'
  end

  post '/friend' do
    if logged_in?
      @friend=Friend.new
      @friend.user_id=current_user.id
      @friend.friend_id= params["friend_id"]
      @friend.save
      redirect to '/friends'

    else
       redirect to '/login'
    end
  end


end
