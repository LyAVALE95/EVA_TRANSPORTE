class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
    		t.string :quantity
    		t.float :cost
    		t.string :size
    		t.string :weigth
      t.timestamps
    end
    add_reference :packages, :type_scaffold, foreign_key: true
  	  	 add_reference :packages, :load, foreign_key: true
  	  	 add_reference :packages, :state, foreign_key: true
  end
end
