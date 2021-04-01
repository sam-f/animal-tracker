class AddReferenceToFeederInFeedingRecords < ActiveRecord::Migration[6.1]
  def change
    add_reference :feeding_records, :feeder, index: true
  end
end
