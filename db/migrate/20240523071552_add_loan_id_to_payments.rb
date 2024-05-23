class AddLoanIdToPayments < ActiveRecord::Migration[5.1]
  def change
    add_reference :payments, :loan, foreign_key: true
  end
end
