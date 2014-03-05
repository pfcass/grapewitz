class AddCharacterToWines < ActiveRecord::Migration
  def change
    add_column :wines, :color, :integer
    add_column :wines, :fizz, :integer
  end
end
