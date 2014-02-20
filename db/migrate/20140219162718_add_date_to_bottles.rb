class AddDateToBottles < ActiveRecord::Migration
  def change
    add_column :bottles, :purchased, :date
  end
end
