class CatsController < ApplicationController

  get '/cats/:id/delete' do
    @cat = Category.find(params[:id])
    if @cat && current_user.id == 1
      @cat.delete
      redirect '/developer'
    else
      redirect '/account'
    end
  end

end
