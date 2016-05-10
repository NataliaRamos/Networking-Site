class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :colleague_id

      t.timestamps null: false
    end
  end
end
