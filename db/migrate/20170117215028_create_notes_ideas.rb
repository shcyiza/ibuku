class CreateNotesIdeas < ActiveRecord::Migration
  def change
    create_table :notes_ideas, id: false do |t|
      t.belongs_to :note
      t.belongs_to :idea
    end
  end
end
