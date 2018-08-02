class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :first_name
      t.text :last_name
      t.text :nickname
      t.text :email
      t.text :password_digest
    end
  end
end
