class LessonGradeLevel < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :grade_level
  validates :lesson, presence: true
  validates :grade_level, presence: true
end
