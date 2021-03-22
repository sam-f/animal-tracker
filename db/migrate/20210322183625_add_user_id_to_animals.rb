class AddUserIdToAnimals < ActiveRecord::Migration[6.1]
  def change
    add_reference :animals, :user, null: false, index: true
  end
end
