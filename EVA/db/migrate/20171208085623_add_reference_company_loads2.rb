class AddReferenceCompanyLoads2 < ActiveRecord::Migration[5.1]
  def change
  	add_reference :loads, :company, foreign_key: true
  end
end
