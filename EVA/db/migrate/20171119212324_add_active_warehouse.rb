class AddActiveWarehouse < ActiveRecord::Migration[5.1]
  def change
  	add_column :warehouses, :active, :bool
  end
end
