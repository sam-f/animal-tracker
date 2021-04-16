class RenameDateAquiredToDateAcquired < ActiveRecord::Migration[6.1]
  def change
    rename_column :animals, :date_aquired, :date_acquired
  end
end
