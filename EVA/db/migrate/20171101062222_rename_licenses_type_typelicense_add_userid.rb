class RenameLicensesTypeTypelicenseAddUserid < ActiveRecord::Migration[5.1]
  def change
  		rename_column :licenses, :type, :type_license
  		add_reference :licenses, :user, foreign_key: true
  end
end
