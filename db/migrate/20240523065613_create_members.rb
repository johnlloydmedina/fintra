class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :member_id

      t.timestamps
    end
  end
end
