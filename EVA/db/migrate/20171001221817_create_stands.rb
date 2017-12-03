class CreateStands < ActiveRecord::Migration[5.1]
  def change
    create_table :stands do |t|
    		t.string :name
    		t.string :description
    		t.string :timeMax
    		t.string :extSpent
      t.timestamps
    end
  end
end
