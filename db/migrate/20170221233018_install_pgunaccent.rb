class InstallPgunaccent < ActiveRecord::Migration
  def change
    def up
      execute "CREATE EXTENSION IF NOT EXISTS unaccent;"
    end

    def down
      execute "DROP EXTENSION IF EXISTS unaccent;"
    end
  end
end
