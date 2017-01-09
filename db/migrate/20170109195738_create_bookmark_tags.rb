class CreateBookmarkTags < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmark_tags do |t|
      t.integer :bookmark_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
