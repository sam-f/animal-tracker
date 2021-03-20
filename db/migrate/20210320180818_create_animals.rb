class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.string :scientific_name
      t.string :common_name
      t.string :name, null: false
      t.string :sex, default: "u", limit: 1, null: false
      t.string :age
      t.date :birthday
      t.text :description
      t.timestamps
    end
  end
end
