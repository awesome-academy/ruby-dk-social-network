class General < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :generalable, polymorphic: true
end
