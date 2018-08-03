require 'spec_helper'
require 'pry'

describe 'Models and Tables' do

  before do
    @user = User.create(:first_name => "Frank", :last_name => "Mccallion", :nickname => "Keith", :title => "DBCA Creator", :email => "user@test.com", :password => "password")
    @category = Category.create(:name => "Directory")
    @county = County.create(:name => "Ventura")
    @location = Location.create(:county_id => @county.id, :city => "Somis", :zip => 93066, :locality => "Hwy 118")
    @org = Organization.create(:user_id => @user.id, :category_id => @category.id, :location_id => @location.id, :name => "DBCA", :address => "1111 Big Sur Rd.", :phone => "805-867-5309", :email => "org@test.com", :website => "www.dbca.com", :account => "Colonel", :description => "CRUD Application Interface")
    @rank = Rank.create(:aggregate_value => 1, :daily_value => 1, :sort => 1)
    @tag = Tag.create(:name)
  end
  it 'can slug the org name' do
    expect(@organization.slug).to eq("dbca")
  end

end
