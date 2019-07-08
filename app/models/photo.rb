class Photo < ApplicationRecord
  has_one :general, as: :generalable
  has_one :post, through: :general, source: :post
  has_one :post, through: :general, source: :post
end
