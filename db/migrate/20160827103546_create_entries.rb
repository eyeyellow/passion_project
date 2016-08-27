class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :description
      t.string :entry_type_id

      t.timestamps
    end
  end
end
