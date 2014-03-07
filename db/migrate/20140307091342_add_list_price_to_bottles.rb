class AddListPriceToBottles < ActiveRecord::Migration
  def change
    add_column :bottles, :list_price, :decimal
  end
end
