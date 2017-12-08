class AddReferenceCompanyLicense < ActiveRecord::Migration[5.1]
  def change
  	add_reference :licenses, :company, foreign_key: true
  end
end
