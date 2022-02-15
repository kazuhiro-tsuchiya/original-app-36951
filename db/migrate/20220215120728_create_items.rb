class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.integer :price, null: false
      t.integer :quantity_id, null: false
      t.integer :size_id
      t.references :user, null: false, foreign_key: true 

      t.timestamps
    end
  end
end
