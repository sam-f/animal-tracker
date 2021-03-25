class CreateStockLists < ActiveRecord::Migration[6.1]
  def change
    create_table :stock_lists do |t|
      t.references :user, null: false, index: true
      t.string :name, null: false
      t.date :available_from
      t.text :description
      t.boolean :visible, null: false, default: true
      t.timestamps
    end
  end
end
