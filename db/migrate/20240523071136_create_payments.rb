class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.string :payment_reference_number
      t.references :member, foreign_key: true
      t.date :date
      t.decimal :payment_amount
      t.string :payment_status
      t.integer :review_by

      t.timestamps
    end
  end
end
