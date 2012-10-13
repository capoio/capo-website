class RemovePaperTrail < ActiveRecord::Migration

  def up
    remove_index :versions, [:item_type, :item_id]
    drop_table :versions

    rename_column :snippets, :code_version, :version
  end

  def down
    create_table :versions do |t|
      t.string   :item_type, :null => false
      t.integer  :item_id,   :null => false
      t.string   :event,     :null => false
      t.string   :whodunnit
      t.text     :object
      t.datetime :created_at
    end
    add_index :versions, [:item_type, :item_id]

    rename_column :snippets, :version, :code_version
  end
end
