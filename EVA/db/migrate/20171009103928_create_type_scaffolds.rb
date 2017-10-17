class CreateTypeScaffolds < ActiveRecord::Migration[5.1]
  def change
    create_table :type_scaffolds do |t|
    	t.string :description
    	t.string :weigth
    	t.string :size
    	t.string :category
    	t.float :cost
    	t.string :extraHours
      t.timestamps
    end
    add_reference :type_scaffolds, :license, foreign_key: true
  	  	 add_reference :loads, :type_scaffolds, foreign_key: true
  end
end
