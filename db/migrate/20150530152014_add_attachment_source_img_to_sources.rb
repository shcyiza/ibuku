class AddAttachmentSourceImgToSources < ActiveRecord::Migration
  def self.up
    change_table :sources do |t|
      t.attachment :source_img
    end
  end

  def self.down
    remove_attachment :sources, :source_img
  end
end
