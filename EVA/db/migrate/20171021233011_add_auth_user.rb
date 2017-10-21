class AddAuthUser < ActiveRecord::Migration[5.1]
  def change
  	    add_column :users, :company_id, :bigint
    	add_column :users, :authentication_token, :string, :limit => 30
     
  end
end
