class ChangeColumnNamesToOrigin < ActiveRecord::Migration
  def change
    rename_table :origins_types, :origin_types
    rename_column :origins, :source_img_file_name, :origin_img_file_name
    rename_column :origins, :source_img_content_type, :origin_img_content_type
    rename_column :origins, :source_img_file_size, :origin_img_file_size
    rename_column :origins, :source_img_updated_at, :origin_img_updated_at
  end
end
