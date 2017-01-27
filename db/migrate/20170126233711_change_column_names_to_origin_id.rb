class ChangeColumnNamesToOriginId < ActiveRecord::Migration
  def change
    rename_column :origins, :origins_type_id, :origin_type_id
    rename_column :reviews, :source_id, :origin_id
    rename_column :notes, :source_id, :origin_id
  end
end
