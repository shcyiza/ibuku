class ChangeQuoteInNotes < ActiveRecord::Migration
  def change
    change_column :notes, :quote, :text
  end
end
