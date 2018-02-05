class VenuesController < ApplicationController

  get '/venues' do
    @venues = Venue.all
    erb :'venues/index'
  end

end
