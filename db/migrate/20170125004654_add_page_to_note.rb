class AddPageToNote < ActiveRecord::Migration
  def change
    add_column :notes, :page, :integer
  end
end
