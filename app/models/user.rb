class User < ActiveRecord::Base
  has_many :photos
  has_many :tags, through: :photos
  has_many :favorites
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
