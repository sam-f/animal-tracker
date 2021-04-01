class RemoveFoodFromFeedingRecords < ActiveRecord::Migration[6.1]
  def change
    remove_column :feeding_records, :food, :string
  end
end
