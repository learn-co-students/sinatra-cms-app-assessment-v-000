class VenuesController < ApplicationController

  get '/venues' do
    @venues = Venue.all
    @musician = Musician.find_by(id: session[:id])
    erb :'venues/index'
  end

end
