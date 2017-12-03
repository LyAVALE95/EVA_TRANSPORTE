class AddStandRelations < ActiveRecord::Migration[5.1]
  def change
  	  	add_reference :stands, :location, foreign_key: true
  	  	 add_reference :stands, :state, foreign_key: true
  	  	   	add_reference :stands, :rate_expense, foreign_key: true
  end
end
