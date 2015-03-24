class Lesson < ActiveRecord::Base
  has_many :stars
  belongs_to :plan
  belongs_to :subject
  belongs_to :user
  has_many :lesson_grade_levels
  has_many :grade_levels, through: :lesson_grade_levels
  belongs_to :home
  has_many :documents


  has_attached_file :upload, styles: {thumbnail: "60x60#"}
  validates_attachment :upload, content_type: { content_type: ["application/pdf",
      "application/vnd.oasis.opendocument.text",
      "application/vnd.oasis.opendocument.spreadsheet",
      "application/vnd.oasis.opendocument.presentation",
      "application/vnd.oasis.opendocument.graphics", "application/vnd.ms-excel",
      "application/vnd.ms-powerpoint", "application/msword",
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
      "image/jpeg", "image/png"] }

  def self.search(search)
    if search
      # find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
      where('topic ILIKE ? OR description ILIKE ?' , "%#{search}%", "%#{search}%")
    else
      # find(:all)
      Lesson.all
    end
  end

end
