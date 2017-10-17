class CreateLicenses < ActiveRecord::Migration[5.1]
  def change
    create_table :licenses do |t|
    	t.string :type
    	t.float :cost
    	t.datetime :validity
      t.timestamps
    end
  end
end
