class RemoveIndexFromWines < ActiveRecord::Migration
  def change
    remove_index :wines, :brand_id
    remove_index :wines, :variety_id
  end
end
