class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
    			t.string :name
    		t.string :legalName
    		t.string :code
    		t.string :tel
    		t.boolean :active
      t.timestamps
    end
    add_reference :companies, :location, foreign_key: true
  end
end
