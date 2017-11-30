class AddClientcontactCompany < ActiveRecord::Migration[5.1]
  def change
  	  	add_reference :clientcontacts, :company, foreign_key: true
  end
end
