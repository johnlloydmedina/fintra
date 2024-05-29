class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :member_id
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.text :complete_address
      t.string :contact_number
      t.string :email_address
      t.boolean :gender
      t.integer :civil_status
      t.date :birthdate
      t.integer :age
      t.string :profile_picture
      t.string :username
      t.string :password_digest
      t.integer :account_status, default: 0

      t.timestamps
    end
  end
end
