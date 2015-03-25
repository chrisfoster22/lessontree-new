class Lesson < ActiveRecord::Base
  belongs_to :plan
  belongs_to :subject
  belongs_to :user

  has_many :stars
  has_many :lesson_grade_levels
  has_many :grade_levels, through: :lesson_grade_levels
  has_many :lesson_subjects
  has_many :subjects, through: :lesson_subjects
  has_many :documents

  def self.search(subject, grade, search)
    if search
      # find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
      filtered_search = []
      lessons = where('topic ILIKE ? OR description ILIKE ?' , "%#{search}%", "%#{search}%")
      filtered_search = lessons.select {|s| s.subjects.map(&:id).include?(subject)}
      filtered_search

    else
      # find(:all)
      Lesson.all
    end
  end
end
