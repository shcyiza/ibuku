class AddSourceIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :source_id, :integer
  end
end
