class CreateBottles < ActiveRecord::Migration
  def change
    create_table :bottles do |t|
      t.integer :quantity
      t.decimal :price
      t.integer :rating
      t.string :comment
      t.belongs_to :wine, index: true
      t.references :store, index: true

      t.timestamps
    end
  end
end
