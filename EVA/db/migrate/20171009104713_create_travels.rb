class CreateTravels < ActiveRecord::Migration[5.1]
  def change
    create_table :travels do |t|
    	t.string :gpsReads
    	t.datetime :gpsDate
    	t.string :details
    	t.float :cost
    	t.string :kms
    	t.time :hoursPlanned
    	t.time :hoursTraveled
    	t.string :idOrigen
    	t.string :idDestine

      t.timestamps
    end
    add_reference :travels, :carrier_line, foreign_key: true
  	  	 add_reference :travels, :company, foreign_key: true
  	  	 add_reference :travels, :load, foreign_key: true
  	  	 add_reference :travels, :driver, foreign_key: true
  	  	 add_reference :travels, :state, foreign_key: true
  	  	 add_reference :travels, :truck, foreign_key: true
  	  	 add_reference :travels, :mt, foreign_key: true
  	  
  end
end
