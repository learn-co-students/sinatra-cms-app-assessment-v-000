class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username
      t.string :password_digest
  end
end

  def downs
    drop_table :users
  end
end
