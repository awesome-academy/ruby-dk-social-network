class Photo < ApplicationRecord
  has_one :general, as: :generalable
  has_one :post, through: :multi, source: :post

  mount_uploader :image, ImageUploader
end
