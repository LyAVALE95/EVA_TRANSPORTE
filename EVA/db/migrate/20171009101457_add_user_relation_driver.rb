class AddUserRelationDriver < ActiveRecord::Migration[5.1]
  def change
  	add_reference :drivers, :user, foreign_key: true
  	  	
  end
end
