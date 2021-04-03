class AddUnitToWeightRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :weight_records, :unit, :string, null: false, limit: 2
  end
end
