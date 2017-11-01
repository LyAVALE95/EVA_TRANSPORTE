class AddTruckMtsTypescaffoldCarrierlines < ActiveRecord::Migration[5.1]
  def change

  	add_reference :mts, :company, foreign_key: true
  	add_reference :type_scaffolds, :company, foreign_key: true
  	add_reference :carrier_lines, :company, foreign_key: true
  end
end
