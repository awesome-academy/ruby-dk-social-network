class Video < ApplicationRecord
  has_one :general, as: :generalable
  has_one :post, through: :general, source: :post
  has_one :user, through: :general, source: :user

  mount_uploader :clip, ClipUploader
end
