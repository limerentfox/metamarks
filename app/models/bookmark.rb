class Bookmark < ApplicationRecord
  attr_accessor :suggested_tags

  belongs_to :user
  has_many :bookmark_tags
  has_many :tags, through: :bookmark_tags
  validates :url, presence: true, :url => true

  def self.most_popular_bookmarks
    all.group(:url).count.sort_by {|k, v| v}.reverse[0..2]
  end

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip.downcase).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end
end
