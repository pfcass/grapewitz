class RemoveColorFromWines < ActiveRecord::Migration
  def change
    remove_column :wines, :color, :integer
  end
end
