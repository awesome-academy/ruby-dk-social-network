class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :generals, dependent: :destroy
  has_many :comments, through: :generals, source: :generalable,
           source_type: :Comment
  has_many :likes, through: :generals, source: :generalable,
           source_type: :Like
  has_many :photos, through: :generals, source: :generalable,
           source_type: :Photo
  has_many :videos, through: :generals, source: :generalable,
           source_type: :Video
end
