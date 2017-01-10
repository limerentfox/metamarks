class AddColumnTitleToBookmarks < ActiveRecord::Migration[5.0]
  def change
    add_column :bookmarks, :title, :string
    add_column :bookmarks, :description, :string
  end
end
