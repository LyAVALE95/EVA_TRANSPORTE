class CreateCarrierLines < ActiveRecord::Migration[5.1]
  def change
    create_table :carrier_lines do |t|
    		t.string :name
    		t.string :legalName
    		t.string :tel
    		t.string :mail
    		t.string :comercialBusiness
    		t.boolean :active
    		t.string :code

      t.timestamps

    end
     add_reference :carrier_lines, :location, foreign_key: true
  end
end
