class AddCompanyTruck < ActiveRecord::Migration[5.1]
  def change
  	add_reference :trucks, :company, foreign_key: true
  end
end
