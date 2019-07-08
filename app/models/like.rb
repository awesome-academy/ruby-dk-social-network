class Like < ApplicationRecord
  has_one :general, as: :generalable
  has_one :post, through: :general, source: :post
  has_one :user, through: :general, source: :user
end
