class AddIndexesToWines < ActiveRecord::Migration
  def change
    add_index :wines, [ :brand_id, :variety_id ], :unique => true, :name => 'by_brand_and_variety'
  end
end
