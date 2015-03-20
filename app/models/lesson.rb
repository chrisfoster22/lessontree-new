class Lesson < ActiveRecord::Base
  attr_accessible :topic, :description, :upload
  belongs_to :plan
  belongs_to :subject
  belongs_to :user
  belongs_to :grade_level
  belongs_to :home
  has_many :documents
  include PgSearch
  multisearchable :against => [:topic, :description]


  has_attached_file :upload, styles: {thumbnail: "60x60#"}
  validates_attachment :upload, content_type: { content_type: ["application/pdf",
      "application/vnd.oasis.opendocument.text",
      "application/vnd.oasis.opendocument.spreadsheet",
      "application/vnd.oasis.opendocument.presentation",
      "application/vnd.oasis.opendocument.graphics", "application/vnd.ms-excel",
      "application/vnd.ms-powerpoint", "application/msword",
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
      "image/jpeg", "image/png"] }

  def self.search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end
end
  # searchable do
  #   text :topic, :boost => 5
  #   text :description, :created_at
  # end

  # searchable do
  #   text :topic, :boost => 5
  #   text :description, :month_created
  #   text :documents do
  #     documents.map(&:description)
  #   end
  #   time :created_at
  #   string :month_created
  # end

  # def month_created
  #   created_at.strftime("%B %Y")
  # end
