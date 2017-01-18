class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.belongs_to :user, index: true
      t.string :expression
      t.text :description
      t.boolean :relevant
    end
  end
end
