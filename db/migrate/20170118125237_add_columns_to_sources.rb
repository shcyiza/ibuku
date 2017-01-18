class AddColumnsToSources < ActiveRecord::Migration
  def change
    add_column :sources, :published_on, :date
    add_column :sources, :source_type, :string
    add_column :sources, :editors, :string
  end
end
