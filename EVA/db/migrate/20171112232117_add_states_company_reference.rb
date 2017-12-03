class AddStatesCompanyReference < ActiveRecord::Migration[5.1]
  def change
  	add_reference :states, :company, foreign_key: true
  end
end
