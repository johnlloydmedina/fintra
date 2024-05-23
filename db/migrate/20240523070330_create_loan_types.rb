class CreateLoanTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :loan_types do |t|
      t.string :loan_type_name

      t.timestamps
    end
  end
end
