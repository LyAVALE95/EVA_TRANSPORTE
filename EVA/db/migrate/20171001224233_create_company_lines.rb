class CreateCompanyLines < ActiveRecord::Migration[5.1]
  def change
    create_table :company_lines do |t|

      t.timestamps
      
    end
    add_reference :company_lines, :carrier_line, foreign_key: true
      add_reference :company_lines, :company, foreign_key: true
  end
end
