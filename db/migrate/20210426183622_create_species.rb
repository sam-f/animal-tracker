class CreateSpecies < ActiveRecord::Migration[6.1]
  def change
    create_table :species do |t|
      t.references :user, null: false, index: true, foreign_key: {on_delete: :cascade}
      t.string :genus, limit: 140, index: true
      t.string :species, limit: 140, index: true
      t.string :subspecies, limit: 140
      t.string :locality, limit: 140
      t.string :common_name, limit: 140
      t.timestamps
    end
  end
end
