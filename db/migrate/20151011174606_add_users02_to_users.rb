class AddUsers02ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :text
  end
end
