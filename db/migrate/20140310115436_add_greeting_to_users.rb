class AddGreetingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :greeting, :text
  end
end
