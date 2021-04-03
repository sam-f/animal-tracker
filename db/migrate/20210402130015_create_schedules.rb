class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.references :user, null: false, index: true
      t.string :name, null: false, limit: 140
      t.text :description
      t.string :repeat, null: false, limit: 10
      t.date :start_on, null: false
      t.timestamps
    end
  end
end
