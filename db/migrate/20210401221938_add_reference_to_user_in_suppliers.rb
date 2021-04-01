class AddReferenceToUserInSuppliers < ActiveRecord::Migration[6.1]
  def change
    add_reference :suppliers, :user, null: false, index: true
  end
end
