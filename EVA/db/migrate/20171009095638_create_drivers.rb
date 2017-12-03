class CreateDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
    	t.string :code
    	t.string :department
    	t.string :names
    	t.string :lastnames
    	t.string :rfc
    	t.datetime :hiredDate
    	t.datetime :birthday
    	t.string :address
    	t.string :state
    	t.string :movil
    	t.string :tel
    	t.string :cp
    	t.boolean :active
      t.timestamps
    end
      	  	add_reference :drivers, :carrier_line, foreign_key: true
  	  	 add_reference :drivers, :license, foreign_key: true
  	  	   	add_reference :drivers, :truck, foreign_key: true
  end
end
