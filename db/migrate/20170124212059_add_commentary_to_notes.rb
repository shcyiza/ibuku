class AddCommentaryToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :commentary, :text
  end
end
