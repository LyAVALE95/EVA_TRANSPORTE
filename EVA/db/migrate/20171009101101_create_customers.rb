class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
    	t.string :names
    	t.string :lastnames
    	t.string :address
    	t.string :city
    	t.string :state
    	t.string :country
    	t.string :region
    	t.string :cp
    	t.string :notes
    	t.string :state
    	t.string :tel
    	t.string :movil
    	t.string :schedule
    	t.boolean :active
      t.timestamps
    end
    add_reference :customers, :company, foreign_key: true
  	  	 add_reference :customers, :user, foreign_key: true
  end
end
