class CreateRateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :rate_expenses do |t|
    	t.string :name
    	t.string :description
    	t.boolean :active
    	t.float :cost
      t.timestamps
    end
  end
end
