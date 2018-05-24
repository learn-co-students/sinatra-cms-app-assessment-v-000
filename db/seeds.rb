User.delete_all
Client.delete_all
Product.delete_all
ClientProduct.delete_all

User.create(:first_name => 'Baxter', :last_name => 'Black', :username => 'baxter2854', :email => 'bb@example.com', :password => 'pass')
User.create(:first_name => 'John', :last_name => 'Baptist', :username => 'john316', :email => 'jb@example.com', :password => 'word')

Client.create(:first_name => 'John', :last_name => 'Doe', :aka_name => 'tarzan', :age => 'adult', :gender => 'M', :need => 'son', :user_id => 1)
Client.create(:first_name => 'Jane', :last_name => 'Doe', :aka_name => 'jane', :age => 'adult', :gender => 'F', :need => 'daughter', :user_id => 2)

Product.create(:name => 'Coat',:description => 'Fall', :gender => 'M', :size => 'XL', :quantity => 1)
Product.create(:name => 'Coat',:description => 'Winter', :gender => 'F', :size => 'S', :quantity => 1)

ClientProduct.create(:client_id => 1, :product_id => 1)
ClientProduct.create(:client_id => 2, :product_id => 2)