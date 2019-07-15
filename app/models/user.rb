class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  has_many :active_relationships, class_name:  Relationship.name,
           foreign_key: :follower_id,
           dependent:   :destroy

  has_many :passive_relationships, class_name: Relationship.name,
           foreign_key: :followed_id,
           dependent: :destroy

  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

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

  def follow other_user
    following << other_user
  end

  def un_follow other_user
    following.delete other_user
  end

  def following? other_user
    following.include? other_user
  end
end
