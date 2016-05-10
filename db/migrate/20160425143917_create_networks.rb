class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.integer :colleague_id
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
