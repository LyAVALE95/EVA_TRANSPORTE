class AddStandCompany < ActiveRecord::Migration[5.1]
  def change
  	add_reference :stands, :company, foreign_key: true
  end
end
