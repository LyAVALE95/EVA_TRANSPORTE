class AddReferenceCompanyRateExpenses < ActiveRecord::Migration[5.1]
  def change
  	add_reference :rate_expenses, :company, foreign_key: true
  end
end
