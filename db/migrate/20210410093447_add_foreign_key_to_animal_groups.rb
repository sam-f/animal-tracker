class AddForeignKeyToAnimalGroups < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :animal_groups, :users
  end
end
