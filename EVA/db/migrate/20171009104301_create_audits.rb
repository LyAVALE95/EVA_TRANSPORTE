class CreateAudits < ActiveRecord::Migration[5.1]
  def change
    create_table :audits do |t|
    		t.string :results
    		t.string :description
      t.timestamps
    end
    add_reference :audits, :load, foreign_key: true
  end
end
