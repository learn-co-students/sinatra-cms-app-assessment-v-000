require 'spec_helper'
require 'pry'

describe ApplicationController do

  describe "Homepage" do
    it 'loads the homepage' do
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Welcome to DBCA")
    end
  end

end
