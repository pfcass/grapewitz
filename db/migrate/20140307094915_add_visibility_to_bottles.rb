class AddVisibilityToBottles < ActiveRecord::Migration
  def change
    add_column :bottles, :visibility, :integer
  end
end
