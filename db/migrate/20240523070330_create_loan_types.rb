class CreateLoanTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :loan_types do |t|
      t.string :loan_type_name
      t.text :description
      t.integer :interest
      t.string :duration
      t.integer :penalty

      t.timestamps
    end
  end
end
