class AddCharacterToVarieties < ActiveRecord::Migration
  def change
    add_column :varieties, :color, :integer
    add_column :varieties, :fizz, :integer
  end
end
