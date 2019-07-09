class Photo < ApplicationRecord
  has_one :general, as: :generalable
  has_one :user, through: :general, source: :user
  has_one :post, through: :general, source: :post
end
