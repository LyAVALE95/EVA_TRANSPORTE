class CreateWarehouses < ActiveRecord::Migration[5.1]
  def change
    create_table :warehouses do |t|
    			t.string :name
    			t.string :scheduleStart
    			t.string :scheduleEnd
    			t.string :scheduleDays
    			t.string :tel

      t.timestamps
    end
    add_reference :warehouses, :location, foreign_key: true
  	  	 add_reference :warehouses, :company, foreign_key: true
  	  	 add_reference :warehouses, :clientcontact, foreign_key: true
  end
end
