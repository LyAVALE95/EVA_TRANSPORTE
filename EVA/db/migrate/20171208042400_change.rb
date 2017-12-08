class Change < ActiveRecord::Migration[5.1]
  def change
  	change_column :licenses, :validity, :bool
  end
end
