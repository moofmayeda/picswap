class ChangeTableName < ActiveRecord::Migration
  def change
    rename_table :photos_users, :tags
  end
end
