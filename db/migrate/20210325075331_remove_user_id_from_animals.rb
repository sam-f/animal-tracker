class RemoveUserIdFromAnimals < ActiveRecord::Migration[6.1]
  def change
    remove_column :animals, :user_id, :integer
  end
end
