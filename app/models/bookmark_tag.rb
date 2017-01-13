class BookmarkTag < ApplicationRecord
  belongs_to :bookmark
  belongs_to :tag

  def self.most_popular_tags
    ids = get_popular_tags_id
    get_popular_tags_names(ids)
  end

  private

  def self.get_popular_tags_id
    all.group(:tag_id).count(:id).sort_by {|k,v|v}.reverse[0..2]
  end

  def self.get_popular_tags_names(ids)
    ids.map do |tag_id, count|
      Tag.find(tag_id.to_i).name
    end
  end

end
