class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: :tags
  has_many :tags
  has_many :favorites
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  def faved
    Favorite.where(photo_id: self.id).count
  end
end
