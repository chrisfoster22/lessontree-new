class LessonSubject < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :subject
  validates :lesson, presence: true
  validates :subject, presence: true
end
