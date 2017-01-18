class CreateProblematics < ActiveRecord::Migration
  def change
    create_table :problematics do |t|
      t.belongs_to :user, index: true
      t.belongs_to :work, index: true
      t.integer :order
      t.string :titel
      t.text :abstract
      t.timestamps null: false
    end
  end
end
