require 'spec_helper'
require 'pry'

describe 'Models and Tables' do

  before do
    @user = User.create(:first_name => "Frank", :last_name => "Mccallion", :nickname => "Keith", :title => "DBCA Creator", :email => "user@test.com", :password => "password")
    @category = Category.create(:name => "Directory")
    @org = Organization.create(:user_id => @user.id, :category_id => @category.id, :name => "DBCA", :address => "1111 Big Sur Rd.", :phone => "805-867-5309", :email => "org@test.com", :website => "www.dbca.com", :account => "Colonel", :description => "CRUD Application Interface")
  end
  it 'can slug the org name' do
    expect(@org.slug).to eq("dbca")
  end

end
