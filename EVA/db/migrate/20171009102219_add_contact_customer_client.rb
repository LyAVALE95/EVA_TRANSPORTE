class AddContactCustomerClient < ActiveRecord::Migration[5.1]
  def change
  	add_reference :clientcontacts, :warehouse, foreign_key: true
  	  	
  end
end
