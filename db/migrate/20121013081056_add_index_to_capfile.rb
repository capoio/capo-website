class AddIndexToCapfile < ActiveRecord::Migration
  def change
    add_index :capfiles, :identifier, :name => 'identifier_idx'
  end
end
