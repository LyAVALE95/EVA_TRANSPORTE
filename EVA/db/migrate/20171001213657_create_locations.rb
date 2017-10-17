class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
    	t.string :RFID
    	t.string :name
    	t.string :address
    	t.string :coordinates
    	t.string :street
    	t.string :district
    	t.string :extnum
    	t.string :intnum
    	t.string :zipCode
    	t.string :region
    	t.string :city
    	t.string :state
    	t.string :country
    	t.string :description
      t.timestamps
    end
  end
end
