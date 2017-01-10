class Tag < ApplicationRecord
  has_many :bookmark_tags
  has_many :bookmarks, through: :bookmark_tags
  validates :name, uniqueness: true
end
