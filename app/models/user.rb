class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  has_many :generals, dependent: :destroy
  has_many :posts, dependent: :destroy
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
