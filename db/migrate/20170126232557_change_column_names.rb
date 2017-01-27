class ChangeColumnNames < ActiveRecord::Migration
  def change
    rename_table :source_types, :origins_types
    rename_column :origins, :source_type_id, :origins_type_id
  end
end
