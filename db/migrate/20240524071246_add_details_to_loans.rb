class AddDetailsToLoans < ActiveRecord::Migration[5.1]
  def change
    add_column :loans, :mode_of_payment, :integer
    add_column :loans, :purpose, :text
    add_column :loans, :remarks, :text
  end
end
