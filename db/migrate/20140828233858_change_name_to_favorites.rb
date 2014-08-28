class ChangeNameToFavorites < ActiveRecord::Migration
  def change
    rename_table :photos_users, :favorites
  end
end
