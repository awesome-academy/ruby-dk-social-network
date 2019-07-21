class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  delegate :name, :avatar, to: :user, allow_nil: true

  validates :content, presence: true, length: {maximum: Settings.content_max}
end
