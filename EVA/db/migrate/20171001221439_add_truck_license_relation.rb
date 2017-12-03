class AddTruckLicenseRelation < ActiveRecord::Migration[5.1]
  def change
  	add_reference :trucks, :license, foreign_key: true
  end
end
