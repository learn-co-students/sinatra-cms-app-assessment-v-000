require 'spec_helper'
require 'pry'

describe 'Models and Tables' do

  before do
    @user = User.create(:first_name => "Frank", :last_name => "Mccallion", :nickname => "Keith", :title => "DBCA Creator", :email => "user@test.com", :password => "password")
    @category = Category.create(:name => "Directory")
    @county = County.create(:name => "Ventura")
    @location = Location.create(:county_id => @county.id, :city => "Somis", :zip => 93066, :locality => "Hwy 118")
    @tag1 = Tag.create(:name => "Hobbies")
    @tag2 = Tag.create(:name => "Local Clubs")
    @tag3 = Tag.create(:name => "Government Agencies")
    @tag4 = Tag.create(:name => "Contractors")
    @org = Organization.create(:user_id => @user.id, :category_id => @category.id, :location_id => @location.id, :name => "DBCA", :address => "1111 Big Sur Rd.", :phone => "805-867-5309", :email => "org@test.com", :website => "www.dbca.com", :account => "Colonel", :description => "CRUD Application Interface", :aggregate_rank => 1, :daily_rank => 1, :tag1 => @tag1.id, :tag2 => @tag2.id, :tag3 => @tag3.id, :tag4 => @tag4.id)
  end
  it 'can slug the org name' do
    expect(@organization.slug).to eq("dbca")
  end

end
