class AddSourceToAnimals < ActiveRecord::Migration[6.1]
  def change
    add_column :animals, :source, :string, limit: 3, null: false, default: "cb"
  end
end
