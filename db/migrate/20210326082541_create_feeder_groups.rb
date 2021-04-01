class CreateFeederGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :feeder_groups do |t|
      t.references :user, null: false, index: true
      t.string :name, null: false
      t.text :description
      t.timestamps
    end
  end
end
