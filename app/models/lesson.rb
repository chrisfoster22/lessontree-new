class Lesson < ActiveRecord::Base
  belongs_to :user

  has_many :stars
  has_many :lesson_grade_levels
  has_many :grade_levels, through: :lesson_grade_levels
  has_many :lesson_subjects
  has_many :subjects, through: :lesson_subjects
  has_many :documents

  validates_presence_of :topic, :description, :subject_ids

  acts_as_commontable

  def self.query(params)
    if params.slice(:search, :subject_id, :grade_level_id).values.any?(&:present?)
      lessons = joins(:lesson_subjects)
        .joins(:subjects)
        .where('subjects.id = ?', params[:subject_id])
        .joins(:lesson_grade_levels)
        .joins(:grade_levels)
        .where('grade_levels.id = ?', params[:grade_level_id])
        .where('topic ILIKE ? OR description ILIKE ?' , "%#{params[:search]}%", "%#{params[:search]}%")
    else
      Lesson.all
    end
  end
end
