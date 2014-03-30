class RemoveLimitFromComments < ActiveRecord::Migration
  def change
    change_column :bottles, :comment, :text, :limit => nil
  end
end
