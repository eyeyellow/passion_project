class CreateEntriesUsers < ActiveRecord::Migration
  def change
    create_table :entries_users do |t|
      t.integer :entry_id
      t.integer :user_id

      t.timestamps
    end
  end
end
