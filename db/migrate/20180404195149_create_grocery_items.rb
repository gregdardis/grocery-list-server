class CreateGroceryItems < ActiveRecord::Migration[5.1]
  def change
    create_table :grocery_items do |t|
      t.references :grocery_list, foreign_key: true
      t.string :name
      t.boolean :crossed_off

      t.timestamps
    end
  end
end
