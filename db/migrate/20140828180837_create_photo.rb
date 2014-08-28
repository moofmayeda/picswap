class CreatePhoto < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to :user
      t.string :description
      t.timestamps
    end
  end

  def self.up
    add_attachment :photos, :picture
  end

  def self.down
    remove_attachment :photos, :picture
  end
end
