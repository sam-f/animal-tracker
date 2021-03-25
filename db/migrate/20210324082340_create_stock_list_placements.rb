class CreateStockListPlacements < ActiveRecord::Migration[6.1]
  def change
    create_table :stock_list_placements do |t|
      t.references :stock_list, null: false, index: true
      t.references :animal, null: false, index: true
      t.decimal :price, precision: 10, scale: 2
      t.string :name, null: false
      t.text :description
      t.date :available_from
      t.boolean :visible, null: false, default: true
      t.timestamps
    end
  end
end
