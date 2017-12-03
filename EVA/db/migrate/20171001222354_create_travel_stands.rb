class CreateTravelStands < ActiveRecord::Migration[5.1]
  def change
    create_table :travel_stands do |t|
    		t.time :estimatedTime
    		t.time :realTime
    		t.datetime :dateOpen
    		t.datetime :dateClose
    		t.string :description
      t.timestamps
    end
  end
end
