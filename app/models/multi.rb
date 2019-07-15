class Multi < ApplicationRecord
  belongs_to :post
  belongs_to :multiable, polymorphic: true
end
