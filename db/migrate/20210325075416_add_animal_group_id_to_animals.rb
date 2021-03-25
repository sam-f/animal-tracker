class AddAnimalGroupIdToAnimals < ActiveRecord::Migration[6.1]
  def change
    add_reference :animals, :animal_group, null: false, index: true
  end
end
