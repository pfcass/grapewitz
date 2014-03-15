class RemoveFizzFromWines < ActiveRecord::Migration
  def change
    remove_column :wines, :fizz, :integer
  end
end
