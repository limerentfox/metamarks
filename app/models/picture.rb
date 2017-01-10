class Picture < ApplicationRecord
  belongs_to :bookmark

  has_attached_file :picture,
   :path => ":rails_root/public/images/:id/:filename",
   :url  => "/images/:id/:filename"

 do_not_validate_attachment_file_type :picture
end
