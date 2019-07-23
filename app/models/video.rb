class Video < ApplicationRecord
  has_one :multi, as: :multiable
  has_one :post, through: :multi, source: :post

  mount_uploader :clip, ClipUploader
end
