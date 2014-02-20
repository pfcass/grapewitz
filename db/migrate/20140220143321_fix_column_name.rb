class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :bottles, :purchased, :purchased_on
  end
end
