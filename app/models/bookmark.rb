class Bookmark < ApplicationRecord
  belongs_to :user
  has_many :bookmark_tags
  has_many :tags, through: :bookmark_tags
end
