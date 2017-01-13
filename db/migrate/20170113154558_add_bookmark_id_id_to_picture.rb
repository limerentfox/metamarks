class AddBookmarkIdIdToPicture < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :bookmark_id, :integer
  end
end
