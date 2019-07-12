class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  has_many :generals, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :photos, through: :generals, source: :generalable,
           source_type: :Photo
  has_many :videos, through: :generals, source: :generalable,
           source_type: :Video
  has_many :likes, through: :generals, source: :generalable,
           source_type: :Like
  has_many :comments, through: :generals, source: :generalable,
           source_type: :Comment

  mount_uploader :avatar, AvatarUploader
  validates :name, presence: true, length: {minimum: Settings.name_min,
                                            maximum: Settings.name_max}
  validates :user_name, presence: true, length: {minimum: Settings.name_min,
                                                 maximum: Settings.name_max}
end
