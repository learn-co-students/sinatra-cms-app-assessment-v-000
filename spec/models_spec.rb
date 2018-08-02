require 'pry'

describe 'User' do
  before do
    @user = User.create(:first_name => "Frank", :last_name => "McCallion", :nickname => "DBCA creator", :email => "test@test.com", :password => "testing123")
  end
  it 'can slug the username' do
    expect(@user.slug).to eq("dbca-creator")
  end

end
