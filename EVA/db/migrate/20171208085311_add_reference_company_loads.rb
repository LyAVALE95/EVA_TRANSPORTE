class AddReferenceCompanyLoads < ActiveRecord::Migration[5.1]
  def change
  	 	add_column :loads, :active, :bool
  end
end
