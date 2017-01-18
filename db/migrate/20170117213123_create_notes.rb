class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.belongs_to :source, index: true
      t.belongs_to :user, index: true
      t.string :reference
      t.string :quote
    end
  end
end
