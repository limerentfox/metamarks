class User < ApplicationRecord
  has_many :bookmarks
  has_many :bookmark_tags, through: :bookmarks
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
