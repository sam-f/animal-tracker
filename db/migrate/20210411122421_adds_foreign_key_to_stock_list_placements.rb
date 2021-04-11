class AddsForeignKeyToStockListPlacements < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :stock_list_placements, :stock_lists, on_delete: :cascade
  end
end
