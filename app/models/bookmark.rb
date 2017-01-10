class Bookmark < ApplicationRecord
  belongs_to :user
  has_many :pictures, :dependent => :destroy
  has_many :bookmark_tags
  has_many :tags, through: :bookmark_tags
  validates :url, presence: true

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  # def all_pictures=(names)
  #   self.tags = names.split(",").map do |name|
  #     Tag.where(name: name.strip).first_or_create!
  #   end
  # end
  #
  # def all_pictures
  #   self.tags.map(&:name).join(", ")
  # end

end
