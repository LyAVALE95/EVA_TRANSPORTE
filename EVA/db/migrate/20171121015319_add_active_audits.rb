class AddActiveAudits < ActiveRecord::Migration[5.1]
  def change
  	add_column :audits, :active, :bool
  end
end
