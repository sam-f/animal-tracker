class AddReferenceToSupplierInAnimals < ActiveRecord::Migration[6.1]
  def change
    add_reference :animals, :supplier, index: true
  end
end
