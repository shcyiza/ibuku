class ChangeCaterogizedTypeToCaterizableType < ActiveRecord::Migration[5.0]
  def change
    rename_column :shelves, :categorized_type, :categorizable_type
  end
end
