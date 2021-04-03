class CreateScheduleItems < ActiveRecord::Migration[6.1]
  def change
    create_table :schedule_items do |t|
      t.references :schedule, null: false, index: true
      t.string :name, null: false, limit: 140
      t.text :description
      t.integer :position
      t.timestamps
    end
  end
end
