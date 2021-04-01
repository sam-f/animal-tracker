class AddLimitsOnNames < ActiveRecord::Migration[6.1]
  def change
    change_column :animal_groups, :name, :string, null: false, limit: 140
    change_column :animals, :name, :string, null: false, limit: 140
    change_column :feeder_groups, :name, :string, null: false, limit: 140
    change_column :stock_lists, :name, :string, null: false, limit: 140
    change_column :stock_list_placements, :name, :string, null: false, limit: 140
  end
end
