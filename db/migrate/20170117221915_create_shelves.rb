class CreateShelves < ActiveRecord::Migration
  def change
    create_table :shelves do |t|
      t.belongs_to :category
      t.belongs_to :categorizable
      t.string :categorized_type
    end
  end
end
