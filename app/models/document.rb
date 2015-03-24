class Document < ActiveRecord::Base
  # include PgSearch
  # multisearchable :against => [:title, :content]
  belongs_to :lesson

  has_attached_file :upload
  validates_attachment :upload, content_type: { content_type: ["application/pdf",
      "application/vnd.oasis.opendocument.text",
      "application/vnd.oasis.opendocument.spreadsheet",
      "application/vnd.oasis.opendocument.presentation",
      "application/vnd.oasis.opendocument.graphics", "application/vnd.ms-excel",
      "application/vnd.ms-powerpoint", "application/msword",
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
      "image/jpeg", "image/png"] }
end
