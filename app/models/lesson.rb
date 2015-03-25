class Lesson < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user

  has_many :stars
  has_many :lesson_grade_levels
  has_many :grade_levels, through: :lesson_grade_levels
  has_many :lesson_subjects
  has_many :subjects, through: :lesson_subjects
  has_many :documents

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
