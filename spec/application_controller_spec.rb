require 'spec_helper'
require 'pry'

describe ApplicationController do

  describe "Homepage" do
    it 'loads the homepage' do
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Welcome to DBCA Admin Panel!")
    end
  end

  describe "Signup Page" do

    it "Loads the signup page" do
      get '/signup'
      expect(last_response.status).to eq(200)
    end

    it 'signup directs user to orgs index' do
      params = {
        :first_name => "Frank",
        :last_name => "Mccallion",
        :nickname => "Keith",
        :email => "keith@test.com",
        :title => "DCBA Developer",
        :password => "password"
      }
      post '/signup', params
      expect(last_response.location).to include("/orgs")
    end

    it 'does not let a user sign up without a first_name' do
      params = {
        :first_name => "",
        :last_name => "Mccallion",
        :nickname => "Keith",
        :email => "keith@test.com",
        :title => "DCBA Developer",
        :password => "password"
      }
      post '/signup', params
      expect(last_response.location).to include('/signup')
    end

    it 'does not let a user sign up without a last_name' do
      params = {
        :first_name => "Frank",
        :last_name => "",
        :nickname => "Keith",
        :email => "keith@test.com",
        :title => "DCBA Developer",
        :password => "password"
      }
      post '/signup', params
      expect(last_response.location).to include('/signup')
    end

    it 'does not let a user sign up without an email' do
      params = {
        :first_name => "Frank",
        :last_name => "Mccallion",
        :nickname => "Keith",
        :email => "",
        :title => "DCBA Developer",
        :password => "password"
      }
      post '/signup', params
      expect(last_response.location).to include('/signup')
    end

    it 'does not let a user sign up without a title' do
      params = {
        :first_name => "Frank",
        :last_name => "Mccallion",
        :nickname => "Keith",
        :email => "keith@test.com",
        :title => "",
        :password => "password"
      }
      post '/signup', params
      expect(last_response.location).to include('/signup')
    end

    it 'does not let a user sign up without a password' do
      params = {
        :first_name => "Frank",
        :last_name => "Mccallion",
        :nickname => "Keith",
        :email => "keith@test.com",
        :title => "DCBA Developer",
        :password => ""
      }
      post '/signup', params
      expect(last_response.location).to include('/signup')
    end

    it 'creates a new user and logs them in on valid submission and does not let a logged in user view the signup page' do
      params = {
        :first_name => "Frank",
        :last_name => "Mccallion",
        :nickname => "Keith",
        :email => "keith@test.com",
        :title => "DCBA Developer",
        :password => "password"
      }
      post '/signup', params
      get '/signup'
      expect (last_response.location).to include('/orgs')
    end

  end

end
