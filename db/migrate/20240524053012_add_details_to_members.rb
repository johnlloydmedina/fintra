class AddDetailsToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :first_name, :string
    add_column :members, :middle_name, :string
    add_column :members, :last_name, :string
    add_column :members, :complete_address, :text
    add_column :members, :contact_number, :string
    add_column :members, :email_address, :string
    add_column :members, :gender, :string
    add_column :members, :civil_status, :string
    add_column :members, :birthdate, :date
    add_column :members, :age, :integer
    add_column :members, :profile_picture, :string
    add_column :members, :username, :string
    add_column :members, :password_digest, :string
    add_column :members, :account_status, :integer, default: 0
  end
end
