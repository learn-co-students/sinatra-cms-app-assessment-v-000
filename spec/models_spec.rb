require 'spec_helper'
require 'pry'

describe 'User' do

  before do
    @user = User.create(:first_name => "Frank", :last_name => "Mccallion", :nickname => "Keith", :title => "DBCA Creator", :email => "user@test.com", :password => "password")
    @organization = Organization.create(:name => "DBCA", :address => "1111 Big Sur Rd.", :phone => "805-867-5309", :email => "org@test.com", :website => "www.dbca.com", :user_id => @user.id)

  end
  it 'can slug the nickname' do
    expect(@user.slug).to eq("dbca-creator")
  end

end
