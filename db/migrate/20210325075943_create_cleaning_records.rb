class CreateCleaningRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :cleaning_records do |t|
      t.references :animal, null: false, index: true
      t.date :recorded_on, null: false
      t.text :notes
      t.timestamps
    end
  end
end
