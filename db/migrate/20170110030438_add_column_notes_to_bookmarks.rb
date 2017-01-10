class AddColumnNotesToBookmarks < ActiveRecord::Migration[5.0]
  def change
    add_column :bookmarks, :notes, :text
  end
end
