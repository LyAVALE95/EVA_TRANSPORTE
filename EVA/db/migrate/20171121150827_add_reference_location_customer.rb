class AddReferenceLocationCustomer < ActiveRecord::Migration[5.1]
  def change
  	add_reference :customers, :location, foreign_key: true
  end
end
