class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.belongs_to :idea
      t.belongs_to :linkable
      t.string :linked_type
    end
  end
end
