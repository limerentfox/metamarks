class User < ApplicationRecord
  has_many :bookmarks
  has_many :bookmark_tags, through: :bookmarks
end
