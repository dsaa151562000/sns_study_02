class AddUsersToUsers < ActiveRecord::Migration
  def change
    add_column :users, :introduction, :text
  end
end
