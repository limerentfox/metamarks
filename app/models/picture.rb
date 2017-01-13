class Picture < ApplicationRecord

  belongs_to :bookmark,inverse_of: :pictures

  has_attached_file :image, styles: {original: "700x450>", thumb: "170x90>"}
  validates_attachment :image, presence: true,
  content_type: { content_type: ["image/jpeg", "image/jpeg", "image/png"] },
  size: { in: 0..1500.kilobytes }





end
