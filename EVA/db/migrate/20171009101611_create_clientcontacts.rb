class CreateClientcontacts < ActiveRecord::Migration[5.1]
  def change
    create_table :clientcontacts do |t|
    		t.string :names
    		t.string :lastnames
    		t.string :note
    		t.string :tel
    		t.string :movil
    		t.string :mail
    		t.string :hiredate
    		t.boolean :active
      t.timestamps
    end
    add_reference :clientcontacts, :customer, foreign_key: true
  end
end
