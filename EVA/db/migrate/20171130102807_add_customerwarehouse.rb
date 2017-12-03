class AddCustomerwarehouse < ActiveRecord::Migration[5.1]
  def change
  		add_reference :warehouses, :customer, foreign_key: true
  end
end
