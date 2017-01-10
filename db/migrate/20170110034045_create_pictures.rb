class CreatePictures < ActiveRecord::Migration[5.0]
  def self.up
    create_table :pictures do |t|

      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :pictures, :image
  end
end
