class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.string :theme
      t.text :abstract
      t.boolean :in_progress
    end
  end
end
