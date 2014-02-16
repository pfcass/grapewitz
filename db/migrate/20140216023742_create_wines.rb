class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.references :brand, index: true
      t.references :variety, index: true

      t.timestamps
    end
  end
end
