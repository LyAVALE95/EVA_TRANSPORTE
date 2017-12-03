class AddActiveTruck < ActiveRecord::Migration[5.1]
  def change
  		add_column :trucks, :active, :bool
  end
end
