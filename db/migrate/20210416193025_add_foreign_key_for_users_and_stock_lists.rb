class AddForeignKeyForUsersAndStockLists < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :stock_lists, :users, on_delete: :cascade
  end
end
