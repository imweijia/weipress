class Post < ActiveRecord::Base
  # before_save :tagit
  validates :body, :presence => true
  validates :title, :presence => true
  has_many :taggings
  has_many :tags, through: :taggings

end