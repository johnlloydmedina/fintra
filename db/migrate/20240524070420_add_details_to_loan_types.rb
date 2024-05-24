class AddDetailsToLoanTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :loan_types, :description, :text
    add_column :loan_types, :interest, :integer
    add_column :loan_types, :duration, :string
    add_column :loan_types, :penalty, :integer
  end
end
