class AddRefCompanyDriver < ActiveRecord::Migration[5.1]
  def change
  	   add_reference :drivers, :company, foreign_key: true
  end
end
