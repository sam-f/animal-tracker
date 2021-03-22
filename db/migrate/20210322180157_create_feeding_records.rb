class CreateFeedingRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :feeding_records do |t|
      t.references :animal, null: false, index: true
      # The food fed to the animal
      t.string :food, null: false
      t.text :notes
      t.date :recorded_on, null: false
      t.timestamps
    end
  end
end
