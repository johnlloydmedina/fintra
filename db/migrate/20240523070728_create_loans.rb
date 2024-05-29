class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans do |t|
      t.string :control_number
      t.references :member, foreign_key: true
      t.references :loan_type, foreign_key: true
      t.decimal :loan_amount
      t.integer :loan_duration
      t.integer :loan_status, default: 0
      t.text :purpose
      t.text :remarks
      t.integer :processed_by

      t.timestamps
    end
  end
end
