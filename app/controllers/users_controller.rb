class UsersController < ApplicationController

  get "/users/:slug" do
    if logged_in?
      if current_user.slug == params[:slug]
        @user = current_user
        erb :"users/show"
      else
        redirect :"users/#{current_user.slug}"
      end
    else
      redirect :"/login"
    end
  end

end
