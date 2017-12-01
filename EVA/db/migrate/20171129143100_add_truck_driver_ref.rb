class AddTruckDriverRef < ActiveRecord::Migration[5.1]
  def change
  	  	   add_reference :trucks, :driver, foreign_key: true
  end
end
