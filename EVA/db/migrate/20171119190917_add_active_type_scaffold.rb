class AddActiveTypeScaffold < ActiveRecord::Migration[5.1]
  def change
  	add_column :type_scaffolds, :active, :bool
  end
end
