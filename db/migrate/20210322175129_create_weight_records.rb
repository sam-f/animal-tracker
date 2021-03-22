class CreateWeightRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :weight_records do |t|
      t.decimal :weight, precision: 10, scale: 3, null: false
      t.date :recorded_on, null: false
      t.references :animal, null: false, index: true
      t.text :notes
      t.timestamps
    end
  end
end
