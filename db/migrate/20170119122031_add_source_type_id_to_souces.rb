class AddSourceTypeIdToSouces < ActiveRecord::Migration
  def change
    add_column :sources, :source_type_id, :string
  end
end
