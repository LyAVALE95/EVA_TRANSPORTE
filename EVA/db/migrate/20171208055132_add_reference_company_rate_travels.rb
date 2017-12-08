class AddReferenceCompanyRateTravels < ActiveRecord::Migration[5.1]
  def change
  	add_column :travels, :active, :bool
  end
end
