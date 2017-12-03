class CreateTrucks < ActiveRecord::Migration[5.1]
  def change
    create_table :trucks do |t|
    		t.string :enrollment
    	t.string :model
    	t.string :quality
    	t.string :mileage
    	t.string :wheels
    	t.string :gas
    	t.string :loadCapacity
    	t.string :year
    	t.string :producer
    	t.string :BoxSize
      t.timestamps
    end
  end
end
