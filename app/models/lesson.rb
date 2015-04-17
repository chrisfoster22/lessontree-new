class Lesson < ActiveRecord::Base
  belongs_to :user

  has_many :stars
  has_many :lesson_grade_levels
  has_many :grade_levels, through: :lesson_grade_levels
  has_many :lesson_subjects
  has_many :subjects, through: :lesson_subjects
  has_many :documents

  validates_presence_of :topic, :description

  acts_as_commontable

  def starred?(user, lesson)
    user && Star.find_by(lesson_id: lesson.id, user_id: user.id)
  end

  def self.query(params)
    if params.slice(:search, :subject_id, :grade_level_id).values.any?(&:present?)
      lessons = joins(:lesson_subjects)
                .joins(:subjects)
                unless params[:subject_id] == ""
                  lessons = lessons.where('subjects.id = ?', params[:subject_id])
                end
                lessons = lessons.joins(:lesson_grade_levels)
                .joins(:grade_levels)
                unless params[:grade_level_id] == ""
                lessons = lessons.where('grade_levels.id = ?', params[:grade_level_id])
                end
                lessons = lessons.where('topic ILIKE ? OR description ILIKE ?',
                       "%#{params[:search]}%", "%#{params[:search]}%")
    lessons.uniq
    else
      Lesson.all
    end
  end
end
