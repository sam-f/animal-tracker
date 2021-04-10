class AddForeignKeyToAnimals < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :animals, :animal_groups
  end
end
