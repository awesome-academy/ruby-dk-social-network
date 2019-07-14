class Post < ApplicationRecord
  belongs_to :user
  has_many :generals, dependent: :destroy
  has_many :multis, dependent: :destroy
  has_many :photos, through: :multis, source: :multiable,
           source_type: :Photo, dependent: :destroy
  has_many :videos, through: :multis, source: :multiable,
           source_type: :Video, dependent: :destroy
  has_many :likes, through: :generals, source: :generalable,
           source_type: :Like
  has_many :comments, through: :generals, source: :generalable,
           source_type: :Comment

  accepts_nested_attributes_for :photos, :videos

  validates :user_id, presence: true
  validates :content, length: {maximum: Settings.content_max}
  validate :post_presences

  private

  def post_presences
    return if content.present? && photos.present? && videos.present?
    errors.add :content, "Please post something"
  end
end
