class RemoveBirthdayFromAnimals < ActiveRecord::Migration[6.1]
  def change
    remove_column :animals, :birthday, :date
  end
end
