class ChangeLinkedType < ActiveRecord::Migration
  def change
    rename_column :links, :linked_type, :linkable_type
  end
end
