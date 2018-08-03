require 'spec_helper'
require 'pry'

describe 'User' do

  before do
    @user = User.create(:nickname => "DBCA creator")
  end
  it 'can slug the nickname' do
    expect(@user.slug).to eq("dbca-creator")
  end

end
