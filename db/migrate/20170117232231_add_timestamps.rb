class AddTimestamps < ActiveRecord::Migration
  def change
    add_column :works, :created_at, :datetime
    add_column :works, :updated_at, :datetime
    add_column :notes, :created_at, :datetime
    add_column :notes, :updated_at, :datetime
    add_column :ideas, :created_at, :datetime
    add_column :ideas, :updated_at, :datetime
  end
end
