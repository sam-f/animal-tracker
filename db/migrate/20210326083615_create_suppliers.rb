class CreateSuppliers < ActiveRecord::Migration[6.1]
  def change
    create_table :suppliers do |t|
      t.string :name, null: false
      t.string :email
      t.string :phone_number
      t.string :address_line_1
      t.string :address_line_2
      t.string :address_line_3
      t.text :description
      t.string :website
      t.timestamps
    end
  end
end
