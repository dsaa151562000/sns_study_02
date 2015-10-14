class AddUsers03ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :remember_token, :text
  end
end
