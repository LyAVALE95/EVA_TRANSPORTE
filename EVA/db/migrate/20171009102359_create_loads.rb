class CreateLoads < ActiveRecord::Migration[5.1]
  def change
    create_table :loads do |t|
    		t.datetime :arrivalDate
    		t.string :packageNumber
    		t.string :details
    		t.boolean :check
    		t.float :cost

      t.timestamps
    end
    add_reference :loads, :customer, foreign_key: true
  	  	 add_reference :loads, :warehouse, foreign_key: true
  	  	 add_reference :loads, :carrier_line, foreign_key: true
  	  	 add_reference :loads, :state, foreign_key: true
  end
end
