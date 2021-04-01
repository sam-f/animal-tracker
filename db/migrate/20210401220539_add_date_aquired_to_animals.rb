class AddDateAquiredToAnimals < ActiveRecord::Migration[6.1]
  def change
    add_column :animals, :date_aquired, :date
  end
end
