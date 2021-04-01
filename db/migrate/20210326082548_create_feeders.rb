class CreateFeeders < ActiveRecord::Migration[6.1]
  def change
    create_table :feeders do |t|
      t.references :feeder_group, null: false, index: true
      t.string :name, null: false
      t.integer :count, null: false, default: 0
      t.decimal :weight, precision: 10, scale: 3
      t.decimal :cost, precision: 10, scale: 2
      t.text :description
      t.timestamps
    end
  end
end
