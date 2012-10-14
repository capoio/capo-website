class AddCountToCapfiles < ActiveRecord::Migration
  def change
    add_column :capfiles, :count, :integer, :default => 0
  end
end
