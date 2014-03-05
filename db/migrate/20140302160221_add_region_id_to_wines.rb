class AddRegionIdToWines < ActiveRecord::Migration
  def change
    add_reference :wines, :region
  end
end
