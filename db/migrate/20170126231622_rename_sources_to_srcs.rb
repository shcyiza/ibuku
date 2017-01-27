class RenameSourcesToSrcs < ActiveRecord::Migration
  def change
    rename_table :sources, :origins
  end
end
