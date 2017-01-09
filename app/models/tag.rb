class Tag < ApplicationRecord
  has_many :bookmark_tags
  has_many :bookmarks, through: :bookmark_tags
end
