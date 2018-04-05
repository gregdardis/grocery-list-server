class CreateGroceryLists < ActiveRecord::Migration[5.1]
  def change
    create_table :grocery_lists do |t|
      # table has an ID by default
      t.string :title
      t.string :owner
      t.string :last_modified_by
      t.timestamp :created_at

      t.timestamps
    end
  end
end
