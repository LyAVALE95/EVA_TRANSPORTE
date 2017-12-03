class CreateStates < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t|
    	t.string :name
    	t.string :code
    	t.string :grade
    	t.string :protocol
      t.timestamps
    end
  end
end
