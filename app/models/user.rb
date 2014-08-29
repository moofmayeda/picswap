class User < ActiveRecord::Base
  has_many :photos
  has_many :tags, through: :photos
  has_many :favorites
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def points(photo)
    favorite_points = 0
    favorite_points += 10 if self.favorites.include?(Favorite.find_by(photo_id: photo.id))
    favorite_points += 5 if (photo.favorites.count.to_f/User.all.count.to_f >= 0.6)
    favorite_points
  end

  def recommended
    hash_of_points = {}
    Photo.all.each { |photo| hash_of_points[photo] = self.points(photo) }
    top_five = hash_of_points.values.sort.pop(5)
    (hash_of_points.select {|key, value| value >= top_five[0]}).keys
  end
end
