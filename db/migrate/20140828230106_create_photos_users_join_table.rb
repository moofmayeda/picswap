class CreatePhotosUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :photos_users do |t|
      t.belongs_to :photo
      t.belongs_to :user
    end
  end
end
