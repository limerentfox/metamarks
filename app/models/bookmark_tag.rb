class BookmarkTag < ApplicationRecord
  belongs_to :bookmark
  belongs_to :tag
end
